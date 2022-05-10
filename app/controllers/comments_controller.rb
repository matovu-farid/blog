class CommentsController < ApplicationController
  load_and_authorize_resource param_method: :comment_params
  def new
    @comment = Comment.new
  end

  def edit
    @comment = find_comment
  end

  def create
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      success
      redirect_to user_post_url(id: params[:post_id], user_id: params[:user_id])
    else
      show_errors
      render :new, status: 500
    end
  end

  def update
    if @comment.update(comment_params)
      success
      redirect_to user_post_url(id: params[:post_id], author_id: params[:user_id], user_id: params[:user_id])
    else
      show_errors
      render :edit, status: 500
    end
  end

  def destroy
    flash[:notice] = if @comment.destroy
                       'Comment deleted successfully'
                     else
                       'Comment was not deleted'
                     end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def success
    flash[:notice] = 'Your comment was created Successfully'
  end

  def failed
    flash.now[:alert] = 'You comment was not saved'
  end

  def show_errors
    failed
    errors = @comment.errors.map(&:full_message)
    flash.now[:error] = errors.join(' | ')
  end

  def find_comment
    Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
