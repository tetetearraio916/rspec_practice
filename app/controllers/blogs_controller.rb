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
    @blog = current_user.blogs.find(params[:id])
  end

  def  update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_params)
      redirect_to root_path,success: "投稿を更新しました"
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
