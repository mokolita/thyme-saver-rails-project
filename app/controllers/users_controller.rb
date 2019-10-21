class UsersController < ApplicationController
    def index
        redirect_to root_path
    end 

    def new
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            log_in(@user)
            redirect_to user_path(@user)
        else 
            flash.now[:danger] = @user.errors.full_messages
            render :new 
        end 
    end 

    def show 
        @user = current_user
        @plantsuser = PlantsUser.find_by(user: @user)        
    end 

    def edit 
        @user = User.find(current_user.id)
    end 

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update.valid?
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            render :edit 
        end 
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:delete] = 'Your account has been deleted.'
        redirect_to root_path
    end
        


    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end 
end
