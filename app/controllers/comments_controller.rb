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
      flash[:success] = 'Your comment was created Successfully'
      redirect_to user_post_url(id: params[:post_id], user_id: params[:user_id])
    else

      render :new
    end
  end

  def update
    new_comment = create_new_comment

    @comment = find_comment
    @comment.text = new_comment.text
    if @comment.save
      flash[:success] = 'Your comment was created Successfully'
      redirect_to user_post_url(id: params[:post_id], author_id: params[:user_id], user_id: params[:user_id])
    else
      render :edit
    end
  end

  private

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
