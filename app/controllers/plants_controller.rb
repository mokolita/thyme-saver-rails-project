class PlantsController < ApplicationController
    def index 
    end 
   
    def new 
    end 

    def create 
        #raise params.inspect
        #byebug
        @search = TAPIManager.search(params[:name])
        @search.each do |p|
            PlantPlaceholder.new(p[:common_name], p[:scientific_name], p[:id])
        end 
        render :index 
    end
    
    


   

    private 

    # def plant_params
    #     params.require(:)
    # end 
end
