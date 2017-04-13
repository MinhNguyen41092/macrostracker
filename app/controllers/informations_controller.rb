class InformationsController < ApplicationController
	
	def new
		@information = Information.new
	end
	
	def create
		@information = Information.new(information_params)
		@information.user_id = current_user.id
		if @information.save
			flash[:success] = "Your information has been saved"
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	def show
		@information = Information.find(params[:id])
	end
	
	private
		
		def information_params
			params.require(:information).permit(:weight, :height, :age, :gender, :activity_level, :user_id)
		end
end
