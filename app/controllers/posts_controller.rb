class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    respond_to do |format|
      format.html do
        render :index
      end

      format.json do
        render json: @user.posts
      end
    end
  end

  def show
    @user = User.includes(:posts).find_by(id: params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = current_user
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = Post.new(
      author: @user,
      title: params[:post][:title],
      text: params[:post][:text]
    )

    if @post.save
      flash.now[:error] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Oops, something went wrong'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    if @post.destroy
      flash[:notice] = "Your post titled: '#{@post.title}' was successfully deleted"
    else
      flash[:alert] = 'Oops! Cannot delete your post.'
    end
    redirect_to user_posts_path(@author)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
