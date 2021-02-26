class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(session_params[:email])
    if  @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, success: 'ログインに成功しました'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email,:password)
  end
end
