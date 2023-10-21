class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post

  def index
    @comments = @post.comments
    respond_to do |format|
      format.html do
        render :index
      end
      
      format.json do
        
        render json: @comment
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to user_post_path(@comment.post.author_id, @comment.post.id) }
        format.json { render json: @comment, status: :created }
      else
        flash.now[:error] = 'Oops, something went wrong'
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    if @comment.destroy
      flash[:notice] = 'Comment was successfully deleted'
    else
      flash[:alert] = 'Oops! Cannot delete your comment.'
    end
    redirect_to user_post_path(@post.author_id, @post.id)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
