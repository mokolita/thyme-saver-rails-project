class PlantsUser < ApplicationRecord
    belongs_to :user 
    belongs_to :plant
    has_many :instructions
    accepts_nested_attributes_for :instructions, allow_destroy: true 

    scope :owns, -> { where status: 'Own' }
    scope :wants, -> { where status: 'Want' }

    def self.owned_plants(user)

        pu = PlantsUser.all.where(user_id: user).owns
        @plants = pu.map do |pu_object|
            plant_id = pu_object.plant_id
            Plant.find(plant_id)
        end 

    end 

end
