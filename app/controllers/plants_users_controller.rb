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

    def update
       
    end 

    def add_status 
        user = current_user 
        plants_user = PlantsUser.find(params[:id])
        plants_user.update_attribute(:status, params[:status])
        redirect_to user_path(user) 
       
    end 

    def destroy 
        plantsuser = PlantsUser.find_by(user_id: join_params[:user_id], plant_id: join_params[:plant_id])
        plantsuser.instructions.destroy 
        redirect_to user_path(current_user)
    end 



    private 

    def pu_params
        params.require(:plants_user).permit(:id, :status, :instructions_attributes => [:id, :notes])
    end 

    def join_params
        params.permit(:user_id, :plant_id)
    end 
end
