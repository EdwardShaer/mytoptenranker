class Question < ApplicationRecord
    validates :prompt, presence: true, uniqueness: true

    has_many :options 


    def set_aggregates!
        sorted_options = self.options.sort_by {|opt| opt.score} 
        self.aggregate_1 = sorted_options[0]
        self.aggregate_2 = sorted_options[1]
        self.aggregate_3 = sorted_options[2]
        self.aggregate_4 = sorted_options[3]
        self.aggregate_5 = sorted_options[4]
        self.aggregate_6 = sorted_options[5]
        self.aggregate_7 = sorted_options[6]
        self.aggregate_8 = sorted_options[7]
        self.aggregate_9 = sorted_options[8]
        self.aggregate_10 = sorted_options[9]
    end


end