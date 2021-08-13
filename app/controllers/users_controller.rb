class UsersController < ApplicationController
  before_action :logged_in_user, { only: [:show, :edit] }
  before_action :correct_user, { only: [:show, :edit] }

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

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments,
                                   :email, :phone_number)
    end
end
