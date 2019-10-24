class PlantsController < ApplicationController
    before_action :logged_in_user, only: [:destroy]
    before_action :correct_user,   only: [:destroy]

    def index 
    end 
   
    def new 
    end 

    def create 
        user = current_user
        plant = Plant.find_or_create_from_placeholder(params[:plant_id], user)
        if !plant.nil?
           pu = PlantsUser.new(plant: plant, user: user)
            if pu.save
                redirect_to user_path(user) 
            else 
                flash[:warning] = "Something went wrong!"
                redirect_to '/' 
            end 
        else
            flash[:warning] = "Something went wrong!"
           redirect_to '/'
        end
    end

    def show
        redirect_to '/'
    end 
    
    
    def search 
        @name = params[:name]
        @search = TAPIManager.search(params[:name])
        
        @placeholders = @search.map do |p|
            PlantPlaceholder.new_from_hash(p)
        end 
        render :index 
    end 

    def destroy
        
        p = Plant.find_by(id: params[:user_id])
        p.destroy
        redirect_to user_path(current_user)
    end 

   

    private 


    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

    def correct_user
        @user = User.find_by(id: params[:user])
        @user == current_user
    end
end
