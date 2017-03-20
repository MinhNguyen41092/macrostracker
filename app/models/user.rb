class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	attr_accessor :login
  
	validates :username,
 		presence: true, 
 		uniqueness: {
 			case_sensitive: false
   		}
  # Only allow letter, number, underscore and punctuation.
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
		  where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
		else
		  where(conditions).first
		end
	end
end
