class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '#', success: '登録に成功しました'
    else
      render :new
      flash[:dander] = "ユーザーの登録に失敗しました"
    end
  end

  private

  def user_params
    params.require(:users).permit(:username, :age, :email, :password, :password_confirmation)
  end
end

