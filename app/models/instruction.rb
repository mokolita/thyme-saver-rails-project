class Instruction < ApplicationRecord
    belongs_to :plants_user
    validates :notes, presence: true 
end
