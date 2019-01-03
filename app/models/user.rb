class User < ApplicationRecord
  has_secure_password
  has_one :user_profile
  before_destroy :destroy_profile

  validates :username,
    :presence => true,
    :length => {:minimum => 4}
  validates :password,
    :presence => true,
    :length => {:within => 6..40}
  
  def self.authenticate(params)
    if @user = User.find_by_username(params[:username])
      return @user.authenticate(params[:password])
    end
    return nil
  end

  def self.new_user?(params)
    if not User.find_by_username(params[:username])
      if params[:password] == params[:password_confirmation]
        return true
      end
    end
    return false
  end

  private

  def destroy_profile
    profile = self.user_profile
    if profile
      profile.destroy
    end
  end
end
