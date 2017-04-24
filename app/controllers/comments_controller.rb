class CommentsController < ApplicationController
  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    
    @comment.save
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      flash[:error] = "Invalid Comment Input"
			redirect_to article_path(@comment.article)
		end
  end
  
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end
  
  private
    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end

end
