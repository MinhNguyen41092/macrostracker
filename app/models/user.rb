class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
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
	
	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
    end
	end
end
