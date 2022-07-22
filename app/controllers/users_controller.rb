class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    p params
  end

  def show
    @user = User.find(params[:id])
    p params
  end
end
