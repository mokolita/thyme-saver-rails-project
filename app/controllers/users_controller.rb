class UsersController < ApplicationController
    before_action :logged_in_user, only: [:show, :edit, :update]
    before_action :correct_user,   only: [:edit, :update]

    
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
        @plants = @user.plants
    end
    
    def owns
        
        @user = current_user
        pu = PlantsUser.owned_plants(@user.id)
        @plants = pu.map do |pu_object|
            plant_id = pu_object.plant_id
            Plant.find(plant_id)
        end 
        render :show
    end 

    def wants
        @user = current_user
        pu = PlantsUser.wanted_plants(@user.id)
        @plants = pu.map do |pu_object|
                    plant_id = pu_object.plant_id
                    Plant.find(plant_id)
                end 
        render :show
    end 

    def edit 
        @user = User.find(current_user.id)
    end 

    def update 
        @user = User.find(params[:id])
        
        if @user.update(user_params)
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

    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end
end
