require 'spec_helper'
require 'rails_helper'

describe Option do 
    it { should belong_to(:question)}
    #ensure virtual column works
    it { should have_db_column(:score)}
    
end