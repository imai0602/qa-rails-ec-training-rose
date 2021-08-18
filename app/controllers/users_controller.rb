class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit]
  before_action :correct_user, only: %i[show edit]
  ##### TODO: 「ユーザー退会」のissueで "only: %i[update delete]"とする。 ######
  before_action :ensure_normal_user, only: :update
  #########################################################################
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

  def ensure_normal_user
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
end
