require 'spec_helper'
require 'rails_helper'

describe Suggestion do 
    it { should validate_presence_of(:content)}
    it { should belong_to(:user)}
end