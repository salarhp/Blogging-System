class Admin::PostsController < Admin::ApplicationController
  def new
    @page_title = 'Add post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]="post created"
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]="post updated"
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]="post deleted"
    redirect_to admin_posts_path
  end

  def index
    @posts = Post.all
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tag, :image, :body)
  end
end
