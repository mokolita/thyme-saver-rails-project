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

    def omniauth
      
      user = User.where(email: auth[:email]).first_or_create do |u|
        u.uid = auth['uid']
        u.name_from_fb = auth['info']['name']
        u.email = auth['info']['email']
      end 
      user.app_name
      session[:user_id] = user.id
      render user_path(user)
    end 

    private 

    def auth
      request.env['omniauth.auth']
    end
end
