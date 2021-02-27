class BlogsController < ApplicationController
  def index
    @blogs = current_user.feed
  end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blogs_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
