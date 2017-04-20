class Information < ApplicationRecord
	belongs_to :user
	
	validates :weight, presence: true, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }
	validates :height, presence: true, numericality: { greater_than_or_equal_to: 140, less_than_or_equal_to: 200 }
	validates :age, presence: true
	validates :gender, presence: true
	validates :activity_level, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
	validates :user_id, presence: true
	validates :diet_plan, presence: true
	validates :result, presence: true
	  
	def self.calBMR(information)
	  x = (10*information.weight) + (6.25*information.height) - (5*information.age)
    if information.gender == 1
      information.bmr = x + 5
    else
	    information.bmr = x - 161
    end
	end
	
	def self.calResult(information)
	  base_cal = information.bmr * information.activity_level
	  if information.diet_plan == 1
	    information.result = base_cal
    elsif information.diet_plan == 2
      information.result = base_cal + (base_cal * 0.2)
    else 
      information.result = base_cal - (base_cal * 0.2)
    end
	end
end
