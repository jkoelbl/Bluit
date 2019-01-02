module SessionsHelper
  def login(user)
    session[:id] = user.id
    session[:username] = user.username
  end

  def logout
    session[:id] = nil
    session[:username] = nil
  end

  def logged_in?
    return session[:id] != nil
  end
end
