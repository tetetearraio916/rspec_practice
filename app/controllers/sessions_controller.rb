class SessionsController < ApplicationController
  skip_before_action :login_required

  def new; end

  def create
    user = User.find_by(email: session_params[:email])
    # ユーザーがnilである可能性があるのでぼっち演算子
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
