class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
