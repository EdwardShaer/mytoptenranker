class Option < ApplicationRecord
    validates :question_id, :name, presence: true 

    belongs_to :question 

    



end