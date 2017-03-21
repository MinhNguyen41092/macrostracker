require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username, email, password and password confirmation" do
  	user = Fabricate(:user)
  	expect(user).to be_valid
  end
  
  it "is not valid without an username or an email" do
  	user = Fabricate.build(:user, username: nil)
  	expect(user).not_to be_valid
  	
  	user = Fabricate.build(:user, email: nil)
  	expect(user).not_to be_valid
  end
  
  it "is not valid without password" do
  	user = Fabricate.build(:user, password: nil)
  	expect(user).not_to be_valid
  end
  	
end
