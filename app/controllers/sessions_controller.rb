class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    auth = request.env['omniauth.auth']
    Rails.logger.info auth
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    flash[:notice] = "Welcome, #{current_user.name}."
    redirect_to(root_path)
  end
  
  def failure
    flash[:error] = params[:message] || "Authentication failed"
    redirect_to(root_path)
  end
  
  def destroy
    # Log the authorizing user in.
    session[:user_id] = nil
    flash[:notice] = "Succesfully logged Out"
    redirect_to(root_path)
  end
end