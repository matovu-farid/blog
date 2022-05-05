class PostsController < ApplicationController
  POSTS_PER_PAGE = 3

  def index
    @user = User.find(params[:user_id])
    @page = params.fetch(:page, 0).to_i
    @posts = @user.posts.offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end
  def new
    p 'New hit'
     render :new
  end
  def create
    @post = Post.new(params.require(:post).permit(:title,:text))
    @post.author_id = params[:user_id]
    if @post.save
      flash[:success]='Your post was created Successfully'
      redirect_to user_posts_url
    else
      p "Not saved"
      p @post.errors.full_messages
      render :new
    end
  end
end
