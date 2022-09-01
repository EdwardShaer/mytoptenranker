class QuestionsController < ApplicationController

    def index
        #randomize the order the questions appear in on index page
        @questions = Question.all.to_a.shuffle 
        render :index 
    end

    def show
        @question = Question.find(params[:id])
        @question.set_aggregates!
        @aggregates = @question.get_aggregates
        render :show
    end

end