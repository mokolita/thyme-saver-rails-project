class ApplicationController < ActionController::Base
    include SessionsHelper
    include UsersHelper

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
            plants = ApplicationController::TAPIManager.search_plant_by_name(plant)
            @placeholders = PlantPlaceholder.mass_create_from_hash(plants)      
        end


    end 

    helpers
    
   

    def show_instructions(plant_id)
        user = current_user 
        plants_user = PlantsUser.find_by(user_id: user.id, plant_id: plant_id)

        plants_user.instructions.map {|i| i.notes}
    end

    

end
