class User < ApplicationRecord
  has_secure_password

  validates :username,
    :presence => true
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
    if User.find_by_username(params[:username])
      return false
    elsif params[:password] != params[:password_confirmation]
      return false
    else
      return true
    end
  end
end
