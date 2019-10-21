class SessionsController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        @user = User
                .find_by(email: params["session"]["email"])
                .try(:authenticate, params["session"]["password"])
    
        if @user
          log_in(@user)  
          redirect_to user_path(@user)

        else
          flash[:danger] = "Email or password failed to authenticate. Please try again."
          render :new
        end
      end

    def destroy
        log_out
        redirect_to '/'
    end 

    def omniauth
      
      user = User.where(email: auth['info']['email']).first_or_create do |u|
        #byebug
        u.uid = auth['uid']
        u.name_from_fb = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(30) if !u.password_digest
        u.app_name
      end 
      
      session[:user_id] = user.id
      redirect_to user_path(user)
    end 

    private 

    def auth
      request.env['omniauth.auth']
    end
end
