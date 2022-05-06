class PostsController < ApplicationController
  POSTS_PER_PAGE = 3

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @page = params.fetch(:page, 0).to_i
    @posts = @user.posts.offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
    @post = find_post
  end

  def create
    @post = create_new_post
    @post.author_id = params[:user_id]
    if @post.save
      success
      redirect_to user_post_url(id: @post.id)
    else
      show_errors
      render :new, status: 500
    end
  end

  def update
    new_post = create_new_post
    @post = find_post
    @post.title = new_post.title
    @post.text = new_post.text

    if @post.save
      success
      redirect_to user_post_url(@post)
    else
      show_errors
      render :edit, status: 500
    end
  end

  private

  def success
    flash[:notice] = 'Your post was created Successfully'
  end

  def failed
    flash.now[:alert] = 'You post was not saved'
  end

  def show_errors
    failed
    errors = @post.errors.map(&:full_message)
    flash.now[:error] = errors.join(' | ')
  end

  def create_new_post
    Post.new(params.require(:post).permit(:title, :text))
  end

  def find_post
    Post.find(params[:id])
  end
end
