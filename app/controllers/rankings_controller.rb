class RankingsController < ApplicationController
    before_action :require_user!

    def new
        @ranking = Ranking.new
        @question = Question.find(params[:id]) 
        @options = @question.options 
        render :new
    end

    def show 
        @ranking = Ranking.find(params[:id])
        render :show
    end

    def create
        @ranking = Ranking.new(ranking_params)

        if @ranking.save
            redirect_to ranking_url(@ranking)
        else
            flash.now[:errors] = @ranking.errors.full_messages
            render :new 
        end
    end

    def edit
        @ranking = Ranking.find(params[:id])
        render :edit 
    end

    def destroy
        @ranking = Ranking.find(params[:id])
        user = User.find(params[:user_id])
        @ranking.destroy if user.id == @ranking.user_id
        redirect_to root_url 
    end

    private

    def ranking_params
        params.require(:ranking).permit(:user_id, :question_id, :rank_one_id, :rank_two_id, :rank_three_id,
        :rank_four_id, :rank_five_id, :rank_six_id, :rank_seven_id, :rank_eight_id, :rank_nine_id, :rank_ten_id)
    end
end