class User < ApplicationRecord
    before_save { self.email = email.downcase }
    
    has_many :plants_users
    has_many :plants, through: :plants_users

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    
end
