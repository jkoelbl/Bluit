class UserProfilesController < ApplicationController
  include SessionsHelper, UserProfilesHelper

  before_action :if_not_logged, :except => [:show, :index]
  before_action :validate_editor, :except => [:show, :index]

  def show
    @user = User.find(params[:id])
    @profile = @user.user_profile
  end

  def edit
    @profile = UserProfile.find(params[:id])
  end

  def update
    @profile = UserProfile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to user_profile_path(params[:id])
    else
      do_error(:bad_request)
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(
      :display_name,
      :about
    )
  end
end
