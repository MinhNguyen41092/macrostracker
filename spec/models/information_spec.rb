require 'rails_helper'

RSpec.describe Information, type: :model do
  it "is valid with proper data" do
  	information = Fabricate(:information)
  	expect(information).to be_valid
  end
  
  it "is invalid when weight is out of range" do
  	information = Fabricate.build(:information, weight: 20)
  	expect(information).not_to be_valid
  	
  	information = Fabricate.build(:information, weight: 210)
  	expect(information).not_to be_valid
  end
  
  it "is invalid when height is out of range" do
  	information = Fabricate.build(:information, height: 120)
  	expect(information).not_to be_valid
  	
  	information = Fabricate.build(:information, height: 210)
  	expect(information).not_to be_valid
  end
  
  it "is invalid when gender is not checked" do
  	information = Fabricate.build(:information, gender: 0)
  	expect(information).not_to be_valid
  end
  
  it "is invalid when activity level is not valid" do
  	information = Fabricate.build(:information, activity_level: 0)
  	expect(information).not_to be_valid
  end
  
  it "is invalid when user_id is not present" do
  	information = Fabricate.build(:information, user_id: nil)
  	expect(information).not_to be_valid
  end
  
end
