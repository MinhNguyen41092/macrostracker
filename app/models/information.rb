class Information < ApplicationRecord
	belongs_to :user
	
	validates :weight, presence: true, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }
	validates :height, presence: true, numericality: { greater_than_or_equal_to: 140, less_than_or_equal_to: 200 }
	validates :age, presence: true
	validates :gender, presence: true
	validates :activity_level, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
	validates :user_id, presence: true
	validates :diet_plan, presence: true
	validates :result, presence: true
	validates :protein, presence: true
	validates :carb, presence: true
	validates :fat, presence: true
	  
	def self.calBMR(information)
	  x = (10*information.weight) + (6.25*information.height) - (5*information.age)
    if information.gender == 1
      information.bmr = x + 5
    else
	    information.bmr = x - 161
    end
	end
	
	def self.calResult(information)
	  if information.activity_level == 1
	    base_cal = information.bmr * 1.2
    elsif information.activity_level == 2
      base_cal = information.bmr * 1.375
    elsif information.activity_level == 3
      base_cal = information.bmr * 1.55
    elsif information.activity_level == 4
      base_cal = information.bmr * 1.725
    else
      base_cal = information.bmr * 2
	  end  
	  
	  if information.diet_plan == 1
	    information.result = base_cal
    elsif information.diet_plan == 2
      information.result = base_cal + (base_cal * 0.2)
    else 
      information.result = base_cal - (base_cal * 0.2)
    end
	end
	
	def self.calMacros(information)
	  if information.activity_level == (1 || 2)
      information.protein = information.weight * 1.4
    elsif information.activity_level == (3 || 4)
      information.protein = information.weight * 1.6
    else 
      information.protein = information.weight * 1.8
    end
    # 25% of daily calorie intake is fat
    information.fat = (information.result * 0.25) / 9
    
    information.carb = (information.result - (information.protein * 4 + information.fat * 9)) /4
	end
end
