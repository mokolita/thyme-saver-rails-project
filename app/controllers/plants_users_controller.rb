class PlantsUsersController < ApplicationController
    def index

    end 

    def new
        @plants_user = PlantsUser.new
        @plants_user.instructions.build 
           
    end 

    def create
         plants_user = PlantsUser.new(pu_params)
         if plants_user.save
            redirect_to user_path(current_user)
         else 
            flash[:danger] = "Sorry! Your instruction didn't save."
            render :new 
         end 
    end 

    def edit
    end 

    def update
        user = current_user 
        plants_user = PlantsUser.find(params[:id])
        plants_user.update_attribute(:status, params[:status])
        redirect_to user_path(user) 
    end 

    def add_status 
      
       
    end 


    private 

    def pu_params
        params.require(:plants_user).permit(:instructions_attributes => [:id, :notes])
    end 
end
