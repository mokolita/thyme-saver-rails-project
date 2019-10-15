class SessionsController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        user = User
                .find_by(email: params["user"]["email"])
                .try(:authenticate, params["user"]["password"])
    
        if user
          session[:user_id] = user.id
          redirect_to user_path(user)

        else
          render flash[:message] = "401: Unable to authenticate."
        end
      end

    def destroy
        session[:user_id].delete
        redirect_to '/'
    end 
end
