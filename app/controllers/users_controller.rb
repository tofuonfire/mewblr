class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find_by!(username: params[:username])
  end
end