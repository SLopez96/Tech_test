require 'faraday'
require 'date'
class DetailsController < ApplicationController
  def index

    if session[:user_id] == nil
      redirect_to(:controller => 'login', :action => 'log')
    end
    base_url = "https://swapi.dev/api/"

    response = Faraday.get(base_url+params[:type]+"/"+params[:id].to_s+"/")
    @details = JSON.parse(response.body)

    @details.each do |key, value|
      #test if value is url
      if value.is_a?(String) && value.include?("https://swapi.dev/api/")
        response = Faraday.get(value)
        if key != "films"
          if (JSON.parse(response.body)["name"] != nil)
            @details[key] = JSON.parse(response.body)["name"]
          end
        else
          @details[key] = JSON.parse(response.body)["title"]
        end
      elsif value.is_a?(Array)
        value.each_with_index do |content, index|
          
          if content.is_a?(String) && content.include?("https://swapi.dev/api/")
            response = Faraday.get(content)
            regex = %r{https://swapi\.dev/api/(\w+)/(\d+)/}
            matches = content.match(regex)
            if matches
              if key != "films"
                @details[key][index] = '<a href="/details/index?type=' + matches[1] + '&id='+matches[2]+'">' + JSON.parse(response.body)["name"] + '</a>' 
              else
                @details[key][index] = '<a href="/details/index?type=' + matches[1] + '&id='+matches[2]+'">' + JSON.parse(response.body)["title"] + '</a>'
              end
            end
          end
        end
      elsif value.is_a?(String)
        begin
          date = Date.parse(value)
          datetime = DateTime.strptime(value, '%Y-%m-%d')
          @details[key] = datetime.strftime('%d/%m/%Y')
        rescue ArgumentError
        end
      end
    end
  end
end
