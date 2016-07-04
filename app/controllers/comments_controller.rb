class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.admin_id = current_admin.id
    if @comment.save
      AdminMailer.reply(@comment).deliver_later
      redirect_to post_path(@post.id)
    else
    end
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:answer)
  end
end
