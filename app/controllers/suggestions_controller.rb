class SuggestionsController < ApplicationController
    before_action :require_user!
    
    def new
        render :new
    end

    def create
        suggestion = Suggestion.new
        suggestion.user_id = current_user_id
        suggestion.content = suggestion_params[:content]
        if suggestion.save
            redirect_to root_url 
        else
            flash.now[:errors] = suggestion.errors.full_messages[0]
            render :new, status: :unprocessable_entity
        end
    end

    private 

    def suggestion_params = params.require(:suggestion).permit(:content)
end