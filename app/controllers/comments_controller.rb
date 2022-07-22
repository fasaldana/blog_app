class CommentsController < ApplicationController
  def create
    @user = current_user
    @comment = @user.comments.new(comment_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@user.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.decrement(:comments_counter)
    @post.save
    redirect_to user_post_path(current_user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
