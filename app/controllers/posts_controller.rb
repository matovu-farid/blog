class PostsController < ApplicationController
  POSTS_PER_PAGE = 3

  def index
    @user = User.find(params[:user_id])
    @page = params.fetch(:page, 0).to_i
    @posts = @user.posts.offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end

  def show
    @post = find_post
    @comments = @post.comments
  end
  def new
     
  end
  def edit
    @post = find_post
  end
  def create
    @post = new_post
    @post.author_id = params[:user_id]
    if @post.save
      flash[:success]='Your post was created Successfully'
      redirect_to user_post_url(id:@post.id)
    else
      render :new
    end
  end
  def update
    new_post = :new_post
    saved_post = find_post
    saved_post.title = new_post.title
    save_post.text = new_post.text

    if save_post.save
      flash[:success]='Your post was created Successfully'
      redirect_to user_post_url(id:@post.id)
    else
      @post = saved_post
      flash.now[:alert] = 'Invalid Input'
      render :edit
    end
  end
  private
  def new_post
    Post.new(params.require(:post).permit(:title,:text))
  end
  def find_post
    Post.find params[:id]
  end
end
