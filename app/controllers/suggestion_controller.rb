class SuggestionController < ApplicationController

    def new
        render :new
    end

    def create
        suggestion = Suggestion.new
        suggestion.user_id = current_user_id
        suggestion.content = params.require(:suggestion).permit(:content)
        if suggestion.save
            redirect_to root 
        else
            flash[:errors] = suggestion.errors.full_messages
            render :new
        end
    end



end