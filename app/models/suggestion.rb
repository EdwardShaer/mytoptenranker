class Suggestion < ApplicationRecord
    validates :user_id, :content, presence: true 

    belongs_to :user 



end