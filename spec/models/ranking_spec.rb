require 'spec_helper'
require 'rails_helper'

describe Ranking do 
    it { should validate_presence_of(:question_id)}
    it { should belong_to(:user)}
    it { should belong_to(:question)}
    it { should allow_value('', nil, 1).for(:rank_one_id)}
    it { should allow_value('', nil, 1).for(:rank_two_id)}
    it { should allow_value('', nil, 1).for(:rank_three_id)}
    it { should allow_value('', nil, 1).for(:rank_four_id)}
    it { should allow_value('', nil, 1).for(:rank_five_id)}
    it { should allow_value('', nil, 1).for(:rank_six_id)}
    it { should allow_value('', nil, 1).for(:rank_seven_id)}
    it { should allow_value('', nil, 1).for(:rank_eight_id)}
    it { should allow_value('', nil, 1).for(:rank_nine_id)}
    it { should allow_value('', nil, 1).for(:rank_ten_id)}

end