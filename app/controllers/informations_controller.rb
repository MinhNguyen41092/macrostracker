class InformationsController < ApplicationController
	before_action :authenticate_user!
	
	def index
	  @informations = Information.where(user_id: current_user.id).all
	end
	
	def new
		@information = Information.new
	end
	
	def create
		@information = Information.new(information_params)
		@information.user_id = current_user.id
		Information.calBMR(@information)
		Information.calResult(@information)
		Information.calMacros(@information)
		if @information.save
			flash[:success] = "Your information has been saved"
			redirect_to informations_path
		else
			render 'new'
		end
	end
	
	def show
		@information = Information.find(params[:id])
	end
	
	private
		
		def information_params
			params.require(:information).permit(:weight, :height, :age, :gender, :activity_level, :user_id, :diet_plan)
		end
		
end
