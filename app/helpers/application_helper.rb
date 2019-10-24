module ApplicationHelper

    def full_title(page_title = '')
        base_title = "Thyme Saver"
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
    end

    def show_instructions(plant)
      user = current_user 
      plants_user = PlantsUser.find_by(user: user, plant: plant)

     @instructions = plants_user.instructions
     render 'plants/instructions'
  end

  def plants_users_status(plant, user)
    pu = PlantsUser.find_by(user: user, plant: plant)
    
    render '/status', plantsuser: pu
  end
end
