class RankingsController < ApplicationController
    before_action :require_user!

    def new
        @question = Question.find(params[:id]) 
        @options = @question.options 
        ranking_found = false
        current_user.rankings.each do |ranking|
            #if user already has ranking for this question, render edit form
            if ranking.question_id.to_s == params[:id]
                ranking_found = true
            end
        end
        if ranking_found
            redirect_to edit_ranking(params[:id])
        else
            @ranking = Ranking.new
            render :new
        end
    end

    def show 
        @ranking = Ranking.find(params[:id])
        @user = User.find(@ranking.user_id)
        render :show
    end

    def create
        ranking_hash = get_ranking_hash
        question_id_from_params = ranking_params[:question_id]
        @question = Question.find(question_id_from_params)
        @ranking = make_ranking(ranking_hash, question_id_from_params)
        if @ranking.save
            redirect_to ranking_url(@ranking)
        else
            flash.now[:errors] = @ranking.errors.full_messages
            @question = Question.find(question_id_from_params)
            @options = @question.options
            render :new 
        end
    end

    def update


    end

    def edit
        @ranking = Ranking.find_by(user_id: current_user_id, question_id: params[:id])
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

    def make_ranking(ranking_hash, question_id)
        ranking = Ranking.new(question_id: question_id,
        user_id: current_user_id,
        rank_one_id: ranking_hash.key('1'),
        rank_two_id: ranking_hash.key('2'),
        rank_three_id: ranking_hash.key('3'), 
        rank_four_id: ranking_hash.key('4'),
        rank_five_id: ranking_hash.key('5'),
        rank_six_id: ranking_hash.key('6'),
        rank_seven_id: ranking_hash.key('7'),
        rank_eight_id: ranking_hash.key('8'),
        rank_nine_id: ranking_hash.key('9'),
        rank_ten_id: ranking_hash.key('10')
        )
    end

    def get_ranking_hash
        params.require(:ranking_hash).permit('1','2','3','4','5','6','7','8','9','10').to_h
    end
end