class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user.nil?
            flash.now[:errors] = ["Invalid username or password"]
            render :new
        
        #activate? method supplied by rails because a column matches the name
        elsif !user.activated?
            flash.now[:errors] = ["Please check your email to activate your account!"]
            render :new
        
        else
            login_user!(user)
            redirect_to root_url
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil 
        redirect_to new_session_url 
    end
end