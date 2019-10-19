class UsersController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            log_in(@user)
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 

    def show 
        @user = current_user
        @plantsuser = PlantsUser.find_by(user: @user)        
    end 


    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end 
end
