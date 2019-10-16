class ApplicationController < ActionController::Base
    include SessionsHelper
     
    class TAPIManager
       
        BASE_URL = "https://trefle.io/"
        AUTH_HEADER = {headers: {Authorization: "Bearer c3Buc2ptUTN5ZllFYitPSEVHYnlyZz09"}}


        def self.get_plant_by_id(id)
            url = BASE_URL + "/api/plants/#{id}"
            return HTTParty.get(url, AUTH_HEADER)
        end

        def self.search_plant_by_name(name)
            url = BASE_URL + "/api/plants?q=#{name}"
            return HTTParty.get(url, AUTH_HEADER)
        end 

        def self.search(plant)
            @all_searched_plants = []
            @searched_plants = {:common_name => nil, :scientific_name => nil, :id => nil}
            @plant = ApplicationController::TAPIManager.search_plant_by_name(plant)
                @plant.each do |p|
                @searched_plants[:common_name] = p["common_name"]
                @searched_plants[:scientific_name] = p["scientific_name"] 
                @searched_plants[:id] = p["id"]
                @all_searched_plants << @searched_plants
                end 
            return @all_searched_plants
        end
    end 

    

end
