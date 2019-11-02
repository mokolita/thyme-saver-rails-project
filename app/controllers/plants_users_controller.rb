class PlantsUsersController < ApplicationController
    def index

    end 

    def new
        @plants_user = PlantsUser.new
        @plants_user.instructions.build 
           
    end 

    def create
         plants_user = PlantsUser.find_by(user_id: join_params[:user_id], plant_id: join_params[:plant_id])
         plants_user.instructions.new(notes: pu_params[:instructions_attributes]["0"][:notes])
         if plants_user.save
            redirect_to user_path(current_user)
         else 
            flash.now[:danger] = "Sorry! Your instruction didn't save."
            render :new 
         end 
    end 

    def edit
        @plantsuser = PlantsUser.find_by(user_id: join_params[:user_id], plant_id: join_params[:plant_id])
    end 


    def add_status 
        user = current_user 
        plants_user = PlantsUser.find(params[:plants_user][:id])
        if plants_user.update_attribute(:status, params[:plants_user][:status])
            redirect_to user_path(user) 
        else 
            flash.now[:danger] = "Your status didn't update."
        end 
       
    end 

    def destroy 
        
    end 



    private 

    def pu_params
        params.require(:plants_user).permit(:id, :status, :instructions_attributes => [:id, :notes])
    end 

    def join_params
        params.permit(:user_id, :plant_id)
    end 
end
