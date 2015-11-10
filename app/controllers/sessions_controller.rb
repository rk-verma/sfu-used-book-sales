class SessionsController < ApplicationController
 def new
 end
 
 
  def create
    #render text: request.env['omniauth.auth'].to_yaml and return
    
      user = User.from_omniauth(env['omniauth.auth'])
      session[:user_id] = user.id
     
        flash[:success] = "Welcome, #{user.name}!"
        redirect_to root_path
     
      
    end

  def destroy
    flash[:success] = 'Successfully logged out!'
    session[:user_id] = nil
    redirect_to root_path
  end

  def auth_failure
    redirect_to login_path
    flash[:success] = 'Email/password incorrect!'
  end
end