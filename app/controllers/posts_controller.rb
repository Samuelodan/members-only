class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def create
    author_id = current_user.id
    @post = Post.new(post_params)
    @post.User_id = author_id

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
