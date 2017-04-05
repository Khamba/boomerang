class AuthenticationController < ApplicationController

  def login

  end

  def oauth_callback
    render text: 'success'
  end

end
