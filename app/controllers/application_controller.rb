class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, unless: -> {request.format.json?}

    helper_method :current_user, :current_user_id, :logged_in?, :prompt

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def current_user_id
        current_user ? current_user.id : nil
    end

    def logged_in?
        !!current_user
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def require_user!
        redirect_to new_session_url if current_user.nil?
    end

    def prompt 
        if @question
            return @question.prompt 
        elsif @ranking
            return Question.find(@ranking.question_id).prompt
        end
    end

    def prove
        render file: "#{Rails.root}/61B0A4B25ABBB8CB75F19A988BC1EF96.txt", layout: false 
    end

    

end
