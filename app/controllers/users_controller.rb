class UsersController < ApplicationController
    def show 
        redirect_to root_url and return if current_user != User.find(params[:id])
        @rankings = current_user.rankings
        render :show
    end

    def new
        @user = User.new
        render :new
    end 

    def create
        @user = User.new(user_params)

        if @user.save
            ApplicationMailer.activation_email(@user).deliver_now!
            flash[:notice] = 'Success, account created! Click the link in your email to activate.'
            redirect_to new_session_url
        
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def activate
        @user = User.find_by(activation_token: params[:activation_token])
        @user.activate!
        login_user!(@user)
        flash[:notice] = 'Success, account created!'
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end