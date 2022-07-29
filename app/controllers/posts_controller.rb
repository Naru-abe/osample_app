class PostsController < ApplicationController
  def new
  end

  def create
    @post=Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def index
    @posts=Post.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.permit(:content)
  end
end
