class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def show
    @tag = Tag.find(params[:id])
  end
  
  def index
    @tag = Tag.all
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    
    flash[:success] = "Tag '#{@tag.name}' Deleted"
    
    redirect_to tags_path
  end
end
