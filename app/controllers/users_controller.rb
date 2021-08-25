class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit]
  before_action :correct_user, only: %i[show edit]
  before_action :check_guest_user, only: %i[update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_classification_id = 1 # ユーザー種別を購入者に限定する
    if @user.save
      flash[:success] = "ユーザーを登録しました。こちらからログインしてください。"
      redirect_to login_path
    else
      flash[:danger] = "ユーザー情報を登録できませんでした。"
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      flash[:danger] = "ユーザー情報を更新できませんでした。"
      render "edit"
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy!
    flash[:success] = "退会しました。"
    redirect_to root_path
  end

  def check_guest_user
    if current_user.email == "guest@example.com"
      flash[:danger] = "ゲストユーザーは更新・退会はできません。"
      redirect_to edit_user_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments,
                                   :email, :phone_number)
    end

    def correct_user
      user = User.find(params[:id])
      if user != current_user
        flash[:notice] = "他人の情報にアクセスすることはできません。"
        redirect_to root_path
      end
    end
end
