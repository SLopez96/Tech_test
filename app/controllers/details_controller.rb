require 'faraday'
class DetailsController < ApplicationController
  def index
    response = Faraday.get(params[:url])
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
            p content
            response = Faraday.get(content)
            if key != "films"
              @details[key][index] = '<a href="/details/index?url=' + content + '">' + JSON.parse(response.body)["name"] + '</a>' 
            else
              @details[key][index] = '<a href="/details/index?url=' + content + '">' + JSON.parse(response.body)["title"] + '</a>'
            end
          end
        end
      end
    end
  end
end
