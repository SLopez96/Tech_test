class CreateController < ApplicationController
  def index
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.save
    redirect_to :controller => 'login', :action => 'log'
  end
end
