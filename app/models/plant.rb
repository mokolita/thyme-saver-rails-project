class Plant < ApplicationRecord
    has_many :plants_users
    has_many :users, through: :plants_users
    
   def self.create_from_placeholder(pl)
        
   end
        
   def instructions
    user = current_user
    plant =  self.plants_users where plants_users.user_id == user.id 
    plant.instructions.map do |i| 
        i.notes
     end 
    end 

end

