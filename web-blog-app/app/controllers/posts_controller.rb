class PostsController < ApplicationController
  before_action :set_post, only: %i[ create update ]
  before_action :set_current_post, only: %i[ edit show destroy ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post_last =Post.last
    @post_by_id = Post.order(:id)
    # @post_by_created_at = Post.sort_by(&:created_at)
  end

  def create
    @post = Post.new(set_post.merge(user_id: current_user.id))
    if @post.save
      redirect_to post_url(@post), notice: 'posts saved'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
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
    params.require(:post).permit(:id, :title, :post_body, :source, :resource)
  end
end
