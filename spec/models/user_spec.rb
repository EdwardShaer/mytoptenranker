require 'spec_helper'
require 'rails_helper'

describe User do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:session_token)}
    it { should validate_presence_of(:activation_token)}
    it { should validate_presence_of(:password_digest)}
    it { should have_many(:rankings).dependent(:destroy)}
    it { should have_many(:suggestions)}
    

end

describe "validations" do 
    subject {User.new(username: 'exampleusername', email: 'example@gmail.com', password: 'somepassword')}
    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_length_of(:password).is_at_least(6)}
    
end