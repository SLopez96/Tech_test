class LoginController < ApplicationController

  #check user username and password
  def log
    if session[:user_id] != nil
      redirect_to :controller => 'logged', :action => 'index'
    end
  end

  def login
    
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to :controller => 'logged', :action => 'index'
    else
      flash[:notice] = "Invalid username or password"
      redirect_to :controller => 'login', :action => 'log'

    end

  end

end
