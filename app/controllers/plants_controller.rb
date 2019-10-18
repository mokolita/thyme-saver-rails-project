class PlantsController < ApplicationController
    def index 
    end 
   
    def new 
    end 

    def create 
        @plant = TAPIManager.get_plant_by_id(params[:plant_id])   
        user = current_user
        new_plant = Plant.new(common_name: @plant["common_name"], scientific_name: @plant["scientific_name"], api_id: @plant["id"])
        new_plant.perennial = true if @plant["duration"] == "Perennial"
        new_plant.photo = @plant["images"][0] unless @plant["images"] == []
        new_plant.user << user
        if new_plant.save
            redirect_to user_plants_path(user)
        else
            # redirect to home with flash of what went wrong
        end
            
        
    end

    def show
        @plant = Plant.find_by(api_id: params[:api_id])
    end 
    
    
    def search 
        @search = TAPIManager.search(params[:name])
        
        @placeholders = @search.map do |p|
            PlantPlaceholder.new_from_hash(p)
        end 
        render :index 
    end 

    def add 
       

    end 

   

    private 

    # def plant_params
    #     params.require(:)
    # end 
end
