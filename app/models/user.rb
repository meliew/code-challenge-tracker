class User < ActiveRecord::Base
    validates :username, uniqueness: true 
    has_secure_password
    has_many :challenges
    
    def slug 
        username.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        User.all.find do |user|
            user.slug == slug 
        end 
    end


end 
