class SessionsController < ApplicationController
  include SessionsHelper
  
  before_action :if_not_logged, :only => [:destroy]
  before_action :if_logged, :except => [:destroy]

  def new
  end

  def create
    if user = User.authenticate(params[:sessions])
      login = {
        :id => user.id,
        :username => user.username
      }
      login(login)
      redirect_to root_path
    else
      do_error(:bad_request)
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
