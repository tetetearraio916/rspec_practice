class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '登録に成功しました'
    else
      flash.now[:dander] = '登録に失敗しました'
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :age, :email, :password, :password_confirmation)
  end
end
