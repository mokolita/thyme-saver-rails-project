class PlantsController < ApplicationController
    def index 
    end 
   
    def new 
    end 

    def create 
        user = current_user
        plant = Plant.find_or_create_from_placeholder(params[:plant_id], user)
        if !plant.nil?
            redirect_to user_path(user)  
        else
            flash[:warning] = "Something went wrong!"
           redirect_to '/'
        end
    end

    def show
        @plant = Plant.find_by(api_id: params[:api_id])
    end 
    
    
    def search 
        @name = params[:name]
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
