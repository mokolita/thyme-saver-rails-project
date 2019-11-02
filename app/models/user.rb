class User < ApplicationRecord
    before_save { self.email = email.downcase }
    
    has_many :plants_users
    has_many :plants, through: :plants_users

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
    #uniqueness: { case_sensitive: false }
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, on: :create

    def full_name 
        "#{self.first_name} #{self.last_name}"
    end 

    def app_name 
        regular_name = self.name_from_fb.split(' ')
        self.first_name = regular_name[0]
        self.last_name = regular_name[1]
        self.save 
    end 
end
