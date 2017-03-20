require 'rails_helper'



RSpec.describe UsersController, :type => :controller do
	before(:each) do
		@user = Fabricate(:user)
		sign_in @user
	end
	
	describe "Gets show" do
		it "should be successfull" do
			get :show, id: @user.id
			expect(response).to have_http_status(:success)
		end
	end
end
