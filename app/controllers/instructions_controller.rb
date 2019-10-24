class InstructionsController < ApplicationController
    before_action :logged_in_user, only: [:destroy]
    before_action :correct_user,   only: [:destroy]

    def destroy
        
        i = Instruction.find_by(id: params[:instruction][:id])
        i.destroy
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
