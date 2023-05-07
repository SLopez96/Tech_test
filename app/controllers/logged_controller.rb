require 'faraday'

class LoggedController < ApplicationController

    def index
        !!session[:user_id] ? @user = User.find(session[:user_id]) : redirect_to(:controller => 'login', :action => 'log')
        getTypeRessources
    end

    def logout
        if params[:type] != nil
            @type = params[:type]
        end
        session[:user_id] = nil
        redirect_to(:controller => 'login', :action => 'log')
    end

    def getTypeRessources
        response = Faraday.get('https://swapi.dev/api/')
        @result = JSON.parse(response.body)

    end

end
