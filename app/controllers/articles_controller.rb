class ArticlesController < ApplicationController
  include ArticlesHelper
  
  before_action :require_login, except: [:index, :show]
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
    @author = Author.find(@article.author_id)
    
    @article.view_counter
    
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @author = current_user
    @article = Article.new(article_params)
    @article.author_id = @author.id
    @article.save
    
    if @article.save
      flash[:success] = "Article '#{@article.title}' Created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
  end
  
  def edit
    @author = current_user
    @article = Article.find(params[:id])
    
    unless @article.author_id == @author.id
      redirect_to article_path(@article)
    end
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash[:success] = "Article '#{@article.title}' Updated"
    
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.delete
    
    flash[:success] = "Article '#{@article.title}' Deleted"
    
    redirect_to articles_path
  end
end
