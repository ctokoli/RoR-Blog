class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
      render json: @comments
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

  
  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
