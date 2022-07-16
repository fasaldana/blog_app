class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    if like_exist?
      @like = Like.find_by(author_id: @user.id, post_id: @post.id)
      @like.destroy
    else
      @like = @user.likes.build(post_id: @post.id)
      @like.save
    end
    redirect_to posts_path(@post)
  end

  def like_exist?
    Like.where(author_id: @user.id, post_id: @post.id).exists?
  end
end
