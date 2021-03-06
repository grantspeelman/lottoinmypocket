class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id 
  end

  def login_required
    return true if signed_in?
    store_location
    access_denied
    false
  end

  def access_denied
    if request.xhr?
      render(:update) { |page| page.redirect_to(root_path) }
    else
      redirect_to(root_path)
    end
  end

  def store_location
    session['return-to'] = request.request_uri
  end

  def redirect_back_or_default(default)
    if session['return-to'].blank?
      redirect_to default
    else
      redirect_to session['return-to']
      session['return-to'] = nil
    end
  end

end
