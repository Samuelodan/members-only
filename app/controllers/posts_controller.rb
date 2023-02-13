class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @post = Post.new
  end
end