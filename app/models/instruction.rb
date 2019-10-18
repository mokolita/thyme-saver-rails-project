class Instruction < ApplicationRecord
    belongs_to :plants_user
    has_many :reminders 

    validates :notes, presence: true 
end
