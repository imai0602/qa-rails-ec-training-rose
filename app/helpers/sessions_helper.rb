module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログインしているユーザーを返す (ユーザーがログイン中の場合のみ)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def current_user?(user)
    user == current_user
  end

  def correct_user
    current_user = User.find(params[:id])
    unless current_user?(current_user)
      flash[:notice] = "他人の情報にアクセスすることはできません。"
      redirect_to login_path
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil # rubocop:disable Rails/HelperInstanceVariable
  end

  def logged_in_user
    unless logged_in?
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
end
