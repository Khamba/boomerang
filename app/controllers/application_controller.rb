class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout false

  protected

    def current_user
      if @user
        return @user
      elsif session[:user_id]
        @user = User.find(session[:user_id])
        @user.touch
        return @user
      else
        @user = User.create(role: 'guest')
        session[:user_id] = @user.id
        return @user
      end
    end

    def restrict_to(role)
      redirect_to root_path if current_user.role != role
    end
end
