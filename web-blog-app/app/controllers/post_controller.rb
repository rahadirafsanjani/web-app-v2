class PostController < ApplicationController
  before_action :set_current_post, :set_post, only: %i[ show edit update destroy ]
  def index
    @post = Post.all
  end

  def show
    @post_last =Post.last
    @post_by_id = Post.order(:id)
    @post_by_created_at = Post.sort_by(&:created_at)
  end

  def create
    @post = Post.new(set_post.merge(post_id: current_user.id))
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  def update
    if @post.update(set_post)
      redirect_to @post
    else
      render status: :unprocessable_entity
    end
  end

  private
  def set_current_post
    @post = Post.find(params[:id])
  end
  def set_post
    params.require(:post).permit(:title, :post_body, :source, :resource)
  end
end
