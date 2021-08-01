class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:notice] = "ユーザー情報を更新できませんでした。"
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments,
                                   :company_name, :email, :phone_number)
    end
end
