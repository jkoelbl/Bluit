module ApplicationHelper
  include SessionsHelper
  def do_error(status=:ok)
    render html: "<h1>#{status}</h1>".html_safe, :status => status
  end

  def do_json(object=nil, status=:ok)
    render json: object, :status => status
  end
  
  def if_logged
    if logged_in?
      do_error(:unauthorized)
    end
  end

  def if_not_logged
    if not logged_in?
      do_error(:unauthorized)
    end
  end
end
