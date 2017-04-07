class AuthenticationController < ApplicationController

  def login

  end

  def oauth_callback
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  end

end
