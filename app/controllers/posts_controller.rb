class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comment = Comment.new
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
    @likes.destroy_all
    @comments.destroy_all
    @post.destroy
    current_user.decrement(:posts_counter)
    current_user.save
    redirect_to user_posts_path(current_user)
  end
end
