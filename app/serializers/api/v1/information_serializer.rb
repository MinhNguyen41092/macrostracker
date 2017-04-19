class Api::V1::InformationSerializer < Api::V1::BaseSerializer
  attributes :id, :weight, :height, :age, :activity_level, :gender, 
              :user_id, :created_at, :updated_at
  
  belongs_to :user, embed: :users
  
end
