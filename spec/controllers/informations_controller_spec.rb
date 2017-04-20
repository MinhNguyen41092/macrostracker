require 'rails_helper'

RSpec.describe InformationsController, type: :controller do
	
	describe "Sign_in" do
	  before(:each) do
	    @user = Fabricate(:user)
			sign_in @user
			current_user = @user
		end
	  describe "Get routes" do
		  before(:each) do
			  @information = Fabricate(:information)
		  end
		
		  it "should get new" do
			  get :new
			  expect(response).to have_http_status(:success)
		  end
		
		  it "should get show" do
			  get :show, params: { id: @information.id }
			  expect(response).to have_http_status(:success)
		  end
	  end
	
	  describe "Post create with valid attributes" do
		  before(:each) do
			  # Get a hash of information's attributes to pass to the create action 
			  post :create, information: Fabricate.attributes_for(:information)
		  end
		
		  it "should create a new set of information" do
			  expect(Information.count).to eq(1)
		  end
		
		  it "should display success message" do
			  expect(flash[:success]).to eq("Your information has been saved")
		  end
		
		  it "should redirect to root page" do
			  expect(response).to redirect_to(root_path)
		  end
		  it "should calculate bmr when all values are valid" do
        expect(information.bmr).to exist
      end
	  end
	
	  describe "Post create with invalid attributes" do
		  before(:each) do
			  post :create, information: Fabricate.attributes_for(:information, weight: 0)
		  end
		
		  it "should not save invalid information to database" do
			  expect(Information.count).to eq(0)
		  end
		
		  it "should render new template" do
			  expect(response).to render_template "new"
		  end
	  end
  end
end
