class Instruction < ApplicationRecord
    belongs_to :plants_user
    has_many :reminders 
    accepts_nested_attributes_for :reminders
end
