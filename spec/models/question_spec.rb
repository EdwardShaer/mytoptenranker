require 'spec_helper'
require 'rails_helper'

describe Question do 
    it { should validate_presence_of(:prompt)}
    it { should allow_value('', nil, 1).for(:aggregate_1)}
    it { should allow_value('', nil, 1).for(:aggregate_2)}
    it { should allow_value('', nil, 1).for(:aggregate_3)}
    it { should allow_value('', nil, 1).for(:aggregate_4)}
    it { should allow_value('', nil, 1).for(:aggregate_5)}
    it { should allow_value('', nil, 1).for(:aggregate_6)}
    it { should allow_value('', nil, 1).for(:aggregate_7)}
    it { should allow_value('', nil, 1).for(:aggregate_8)}
    it { should allow_value('', nil, 1).for(:aggregate_9)}
    it { should allow_value('', nil, 1).for(:aggregate_10)}
    it { should have_many(:options)}

    
end

describe "validations" do 
    subject {Question.new(prompt: 'here is the prompt')}
    it {should validate_uniqueness_of(:prompt)}
end