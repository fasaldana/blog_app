class UsersController < ApplicationController
  def index
    @users = User.all
    p params
  end

  def show
    @user = User.find(current_user.id)
    p params
  end
end
