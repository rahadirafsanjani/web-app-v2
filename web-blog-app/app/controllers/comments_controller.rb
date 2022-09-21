class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ create update ]
  before_action :set_current_comment, only: %i[ edit update show destroy ]
  def index
    @comment = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def show
    # @commnet_current_user = Comment.joins(:post).where(:posts => { :user_id => @user.id })
    # @comment_current_post = Comment.joins(:post)
  end

  def create
    @comment = Comment.new(set_comment.merge(post_id: params[:post_id],user_id: current_user.id))
    if @comment.save
      redirect_to post_url(@comment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @comment.update(set_comment)
    redirect_to post_path(@comment.post_id)
  end

  private
  def set_current_comment
    @comment = Comment.find(params[:id])
  end
  def set_comment
    params.require(:comment).permit(:comment_body)
  end

end
