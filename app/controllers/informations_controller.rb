class InformationsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@information = Information.new
	end
	
	def create
		@information = Information.new(information_params)
		@information.user_id = current_user.id
		Information.calBMR(@information)
		Information.calResult(@information)
		if @information.save
			flash[:success] = "Your information has been saved"
			redirect_to information_path
		else
			render 'new'
		end
	end
	
	def show
		@information = Information.last
	end
	
	private
		
		def information_params
			params.require(:information).permit(:weight, :height, :age, :gender, :activity_level, :user_id, :diet_plan)
		end
		
end
