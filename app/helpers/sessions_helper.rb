module SessionsHelper
  def login(params)
    session[:id] = params[:id]
    session[:username] = params[:username]
  end

  def logout
    session[:id] = nil
    session[:username] = nil
  end

  def logged_in?
    return session[:id] != nil
  end
end
