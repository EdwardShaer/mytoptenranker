class Question < ApplicationRecord
    validates :prompt, presence: true, uniqueness: true

    has_many :options 


    def set_aggregates!
        sorted_options = self.options.sort_by {|opt| opt.score} 
        
        self.aggregate_1 = sorted_options[0].id
        self.aggregate_2 = sorted_options[1].id
        self.aggregate_3 = sorted_options[2].id
        self.aggregate_4 = sorted_options[3].id
        self.aggregate_5 = sorted_options[4].id
        self.aggregate_6 = sorted_options[5].id
        self.aggregate_7 = sorted_options[6].id
        self.aggregate_8 = sorted_options[7].id
        self.aggregate_9 = sorted_options[8].id
        self.aggregate_10 = sorted_options[9].id
        self.save!
    end

    #refactor: query db once
    def get_aggregates
        return [Option.find(self.aggregate_1),
            Option.find(self.aggregate_2),
        Option.find(self.aggregate_3),
        Option.find(self.aggregate_4),
        Option.find(self.aggregate_5),
        Option.find(self.aggregate_6),
        Option.find(self.aggregate_7),
        Option.find(self.aggregate_8),
        Option.find(self.aggregate_9),
        Option.find(self.aggregate_10)]
        end


end