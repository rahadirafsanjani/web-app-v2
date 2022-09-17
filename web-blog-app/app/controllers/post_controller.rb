class PostController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post_last =Post.last
    @post_by_id = Post.order(:id)
    @post_by_created_at = Post.sort_by(&:created_at)
  end

  def create
    @post = Post.new(set_post)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
 end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def set_post
    params.require(:post).permit(:title, :post_body, :source)
  end
end
