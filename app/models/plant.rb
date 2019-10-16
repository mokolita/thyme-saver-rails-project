class Plant < ApplicationRecord
    has_many :plants_users
    has_many :users, through: :plants

   
        
end
