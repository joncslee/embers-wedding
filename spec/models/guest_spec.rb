require 'spec_helper'

describe Guest do
  it "has a valid factory" do
    guest = FactoryGirl.create(:guest).should be_valid
  end
  
  it "is invalid without a first name" do
    FactoryGirl.build(:guest, first_name: nil).should_not be_valid
  end

  it "is invalid without a last name" do
    FactoryGirl.build(:guest, last_name: nil).should_not be_valid
  end

  it "returns a guest's full name as a string" do
    guest = FactoryGirl.create(:guest, first_name: 'Jon', last_name: 'Lee')
    guest.name.should == 'Jon Lee'
  end

  it "generates a token before saving" do
    FactoryGirl.create(:guest).should be_valid
  end

  it "generates a random token" do
    guest1 = FactoryGirl.create(:guest)
    guest2 = FactoryGirl.create(:guest)
    guest1.token.should_not == guest2.token
  end

  it "generates a 6-character token" do
    guest = FactoryGirl.create(:guest)
    guest.token.length.should == 6
  end
end
