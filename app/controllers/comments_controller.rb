class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def edit
    @comment = find_comment
  end

  def create
    @comment = create_new_comment
    @comment.author_id = params[:user_id]
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
    new_comment = create_new_comment

    @comment = find_comment
    @comment.text = new_comment.text
    if @comment.save
      success
      redirect_to user_post_url(id: params[:post_id], author_id: params[:user_id], user_id: params[:user_id])
    else
      show_errors
      render :edit, status: 500
    end
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
    errors = @comment.errors.map do |error|
      p error
      error.full_message
    end
    flash.now[:error] = errors.join(' | ')
  end

  def create_new_comment
    Comment.new(params_hash)
  end

  def find_comment
    Comment.find(params[:id])
  end

  def params_hash
    params.require(:comment).permit(:text)
  end
end
