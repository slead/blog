class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "post #{@post.title} added successfully."
      redirect_to @post
    else
      errors = []
      @post.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post #{@post.title} deleted successfully."
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
    #@post = post.friendly.find(params[:id])
  end

end
