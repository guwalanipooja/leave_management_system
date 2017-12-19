class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:user].present?
      @user.avatar = params[:user][:avatar]
      @user.save
    end
  end
end