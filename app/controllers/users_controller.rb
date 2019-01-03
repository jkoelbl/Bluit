class UsersController < ApplicationController
  include SessionsHelper, UsersHelper

  before_action :if_not_logged, :only => [:destroy]
  before_action :if_logged, :except => [:destroy, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    generator = UserGenerator.new(user_params)
    if login_params = generator.generate
      login(login_params)
      redirect_to root_path
    else
      generator.degenerate if generator.user_exists?
      redirect_to new_user_path
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
      :password,
      :password_confirmation
    )
  end
end
