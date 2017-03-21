class Information < ApplicationRecord
	belongs_to :user
	
	validates :weight, presence: true, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }
	validates :height, presence: true, numericality: { greater_than_or_equal_to: 140, less_than_or_equal_to: 200 }
	validates :gender, acceptance: { accept: 1 || 2 }
	validates :activity_level, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
	validates :user_id, presence: true
	
end
