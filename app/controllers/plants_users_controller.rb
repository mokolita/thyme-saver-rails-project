class PlantsUsersController < ApplicationController
    def index

    end 

    def new
        @plants_user = PlantsUser.new
        @plants_user.instructions.build.reminders.build  
    end 

    def create
         @plants_user = PlantsUser.create(pu_params)
         redirect_to user_path(current_user)
    end 

    private 

    def pu_params
        params.require(:plants_user).permit(:instructions_attributes => [:notes,
                                            :reminders_attributes => [:comment, :interval]])
    end 
end
