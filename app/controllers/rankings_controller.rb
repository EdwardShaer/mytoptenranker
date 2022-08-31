class RankingsController < ApplicationController
    before_action :require_user!

    def index
        #get questions in random order
        @questions = Question.all.to_a.shuffle
        render :index 
    end

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
            redirect_to edit_ranking_url(params[:id])
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
        note = ranking_params[:note]
        @ranking = make_ranking(ranking_hash, question_id_from_params, note)
        if @ranking.save
            @ranking.add_new_rank_counts
            redirect_to ranking_url(@ranking)
        else
            flash.now[:errors] = @ranking.errors.full_messages
            @question = Question.find(question_id_from_params)
            @options = @question.options
            render :new 
        end
    end

    def update
        ranking_hash = get_ranking_hash
        
        question_id_from_params = ranking_params[:question_id]
        note = ranking_params[:note]
        question = Question.find(question_id_from_params)
        @ranking = make_ranking(ranking_hash, question_id_from_params, note)
        #subtract old ranking from option counts
        old_ranking = Ranking.find_by(user_id: current_user_id, question_id: question_id_from_params)
        old_ranking.subtract_old_rank_counts
        
        if @ranking.save 
            @ranking.add_new_rank_counts
            question.set_aggregates!
            old_ranking.destroy
            redirect_to ranking_url(@ranking)
        else
            old_ranking.add_new_rank_counts
            question.set_aggregates!
            flash.now[:errors] = @ranking.errors.full_messages
            @question = Question.find(question_id_from_params)
            @options = @question.options
            render :new 
        end
    end

    def edit
        @ranking = Ranking.find_by(user_id: current_user_id, question_id: params[:id])
        @question = Question.find(params[:id])
        @options = @question.options
        render :edit 
    end

    def destroy
        @ranking = Ranking.find(params[:id])
        @question = Question.find(@ranking.question_id)
        if current_user_id == @ranking.user_id
            @ranking.subtract_old_rank_counts
            @ranking.destroy
            @question.set_aggregates!
        end
    end

    def recent
        rankings = Ranking.by_recently_updated.limit(15)
        @id_user_rankings = []
        rankings.each do |ranking|
            username = User.find(ranking.user_id).username
            prompt = Question.find(ranking.question_id).prompt 
            @id_user_rankings.append({rank_id: ranking.id, username: username, prompt: prompt})
        end
        render :recent 
    end

    private

    def ranking_params
        params.require(:ranking).permit(:user_id, :question_id, :note, :rank_one_id, :rank_two_id, :rank_three_id,
        :rank_four_id, :rank_five_id, :rank_six_id, :rank_seven_id, :rank_eight_id, :rank_nine_id, :rank_ten_id)
    end

    def make_ranking(ranking_hash, question_id, note)
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
        rank_ten_id: ranking_hash.key('10'),
        note: note)
    end

    def get_ranking_hash
        nums = (1..500).to_a.map {|ele| ele.to_s}
        params.require(:ranking_hash).permit(*nums).to_h
    end
end