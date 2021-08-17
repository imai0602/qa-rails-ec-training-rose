class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "ログインしました"
      redirect_to current_user
    else
      flash.now[:danger] = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = "ログアウトしました"
    redirect_to login_path
  end

  def guest_login
    guest_person = guest_create
    login = guest_person
    flash[:success] = "ゲストユーザーとしてログインしました。"
    ###### TODO: トップページが実装されたらroot_pathに変更する。#####
    redirect_to products_path
    login
  end

  def guest_create
    User.find_or_create_by!(email: "guest@example.com") do |user|
      user.id = 500
      user.password = "testpass"
      user.last_name = "ゲスト"
      user.first_name = "ユーザ"
      user.zipcode = "000-0000"
      user.prefecture = "東京都"
      user.municipality = "探求区"
      user.address = "0-0"
      user.apartments = "探求学園10"
      user.email = "guest@example.com"
      user.phone_number = "00000000000"
      user.company_name = "探求学園"
      user.delete_flag = false
      user.user_classification_id = 1
    end
  end
end
