class User < ApplicationRecord
    has_secure_password
    has_many :plants_users
    has_many :plants, through: :plants_users

    validates_presence_of :email
    validates_uniqueness_of :email 


    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    
end
