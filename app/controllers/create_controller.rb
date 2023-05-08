class CreateController < ApplicationController
  def index
  end

  def create
    User.create(username: params[:username], password: params[:password])
    redirect_to :controller => 'login', :action => 'log'
  end
end
