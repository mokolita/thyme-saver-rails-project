class Plant < ApplicationRecord
    has_many :plants_users
    has_many :users, through: :plants

    def self.search(plant)
        @searched_plants = []
        TAPIManager.search_plant_by_name(plant)
            plant.each do |p|
            @searched_plants << p 
            end 
        return @searched_plants
    end
        
end
