class PlantsUser < ApplicationRecord
    belongs_to :user 
    belongs_to :plant
    has_many :instructions

    accepts_nested_attributes_for :instructions
end
