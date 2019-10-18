class SessionsController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        user = User
                .find_by(email: params["session"]["email"])
                .try(:authenticate, params["session"]["password"])
    
        if user
          log_in(user)  
          redirect_to user_path(user)

        else
          flash.now[:message] = "401: Unable to authenticate."
          render :new
        end
      end

    def destroy
        log_out
        redirect_to '/'
    end 
end
