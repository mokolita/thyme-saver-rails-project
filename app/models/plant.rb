class Plant < ApplicationRecord
    has_many :plants_users
    has_many :users, through: :plants_users
   
   

   def self.find_or_create_from_placeholder(api_id, user)
    plant = Plant.find_by(api_id: api_id)
    
        if plant.nil?
        found_plant = ApplicationController::TAPIManager.get_plant_by_id(api_id)   
        new_plant = Plant.new(common_name: found_plant["common_name"], scientific_name: found_plant["scientific_name"], api_id: found_plant["id"])
        new_plant.perennial = true if found_plant["duration"] == "Perennial"
        new_plant.photo = found_plant["images"][0] unless found_plant["images"] == []
            if new_plant.save 
                new_plant
            else 
                nil
            end 
        else 
            plant 
        end 
   end
        
  

end

