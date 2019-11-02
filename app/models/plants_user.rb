class PlantsUser < ApplicationRecord
    belongs_to :user 
    belongs_to :plant
    has_many :instructions
    accepts_nested_attributes_for :instructions, allow_destroy: true 

    scope :owns, -> { where status: 'Own' }
    scope :wants, -> { where status: 'Want' }

    scope :owned_plants, ->(user){ owns.where(user: user)}
    scope :wanted_plants, ->(user){ wants.where(user: user)}


    # def self.owned_plants(user)

    #     pu = PlantsUser.where(user_id: user).owns
    #     pu.map do |pu_object|
    #         plant_id = pu_object.plant_id
    #         Plant.find(plant_id)
    #     end 

    # end 

    # def self.wanted_plants(user)

    #     pu = PlantsUser.where(user_id: user).wants
    #     pu.map do |pu_object|
    #         plant_id = pu_object.plant_id 
    #         Plant.find(plant_id)
    #     end 

    # end 
end
