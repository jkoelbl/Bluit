class UsersController < ApplicationController
  include SessionsHelper, UsersHelper

  before_action :if_not_logged, :only => [:destroy]
  before_action :if_logged, :except => [:destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if User.new_user?(params) and user.save
      login(user)
      redirect_to root_path
    else
      do_error(:bad_request)
    end
  end

  def destroy
    if user = User.find(params[:id])
      user.destroy
      logout
      redirect_to root_path
    else
      do_error(:not_found)
    end
  end
  
  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end
end
