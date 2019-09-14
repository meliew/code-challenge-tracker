class User < ActiveRecord::Base
    validates :username, uniqueness: true 
    has_secure_password
    has_many :challenges
    has_many :updates, through: :challenges


end 
