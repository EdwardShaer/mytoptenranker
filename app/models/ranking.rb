class Ranking < ApplicationRecord

    validates :user_id, :question, presence: true

    belongs_to :user 
    belongs_to :question
    delegate :prompt, to: :question, prefix: true 

    
    def get_options
        options = [Option.find_by(id: self.rank_one_id),
            Option.find_by(id: self.rank_two_id),
            Option.find_by(id: self.rank_three_id),
            Option.find_by(id: self.rank_four_id),
            Option.find_by(id: self.rank_five_id),
            Option.find_by(id: self.rank_six_id),
            Option.find_by(id: self.rank_seven_id),
            Option.find_by(id: self.rank_eight_id),
            Option.find_by(id: self.rank_nine_id),
            Option.find_by(id: self.rank_ten_id)]

        #remove nil elements
        options = options.select {|opt| opt.present?}
    end

    def add_new_rank_counts
    #Use find_by, not find, so that nil is returned when a user doesn't fill out all ten, rather
    #than raising an error.
        options = self.get_options

        options.each_with_index do |opt, idx| 
            case idx 
            when 0
                opt.rank_count_1 += 1
            when 1
                opt.rank_count_2 += 1
            when 2
                opt.rank_count_3 += 1
            when 3
                opt.rank_count_4 += 1
            when 4
                opt.rank_count_5 += 1
            when 5
                opt.rank_count_6 += 1
            when 6
                opt.rank_count_7 += 1
            when 7
                opt.rank_count_8 += 1
            when 8
                opt.rank_count_9 += 1
            when 9
                opt.rank_count_10 += 1
            end
            opt.save!
        end
    end

    def subtract_old_rank_counts
        options = self.get_options 

        options.each_with_index do |opt, idx| 
            case idx 
            when 0
                opt.rank_count_1 -= 1
            when 1
                opt.rank_count_2 -= 1
            when 2
                opt.rank_count_3 -= 1
            when 3
                opt.rank_count_4 -= 1
            when 4
                opt.rank_count_5 -= 1
            when 5
                opt.rank_count_6 -= 1
            when 6
                opt.rank_count_7 -= 1
            when 7
                opt.rank_count_8 -= 1
            when 8
                opt.rank_count_9 -= 1
            when 9
                opt.rank_count_10 -= 1
            end
            opt.save!
        end
    end

end