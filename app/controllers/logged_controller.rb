class LoggedController < ApplicationController

    def index
        !!session[:user_id] ? @user = User.find(session[:user_id]) : redirect_to(:controller => 'login', :action => 'log')
    end

    def logout
        session[:user_id] = nil
        redirect_to(:controller => 'login', :action => 'log')
    end
end
