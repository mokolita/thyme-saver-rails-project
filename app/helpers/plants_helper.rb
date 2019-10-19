module PlantsHelper
    def instructions
        user = self.current_user
        plant =  self.plants_users where plants_users.user_id == user.id 
        plant.instructions.map do |i| 
            i.notes
         end 
        end 
end
