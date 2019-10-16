class PlantsController < ApplicationController
    def index 
    end 
   
    def new 
    end 

    def create 
        
        @search = TAPIManager.search(params[:name])
        @search.each do |p|
            PlantPlaceholder.new(p[:common_name], p[:scientific_name], p[:id])
        end 
        redirect_to plants_path 
    end
    
    


   

    private 

    # def plant_params
    #     params.require(:)
    # end 
end
