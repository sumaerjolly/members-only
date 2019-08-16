class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new 
  end

  def create
    if current_user.posts.new(post_params).save
      redirect_to posts_url
    else
      render :new
    end
  end 


  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end 


end
