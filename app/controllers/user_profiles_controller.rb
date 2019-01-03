class UserProfilesController < ApplicationController
  include UserProfilesHelper

  before_action :if_not_logged, :except => [:show, :index]
  before_action :validate_profile_editor, :except => [:show, :index]

  def show
    @is_editor = valid_profile_editor?
    @user = User.find(params[:id])
    @profile = @user.user_profile
    @text_posts = @profile.text_posts.last(10).reverse
  end

  def edit
    @profile = UserProfile.find(params[:id])
  end

  def update
    profile = UserProfile.find(params[:id])
    if profile.update(profile_params)
      redirect_to profile
    else
      redirect_to edit_user_profile_path
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
