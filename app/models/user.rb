class User < ActiveRecord::Base
    validates :email, presence: true, 
                      uniqueness: true
                      
    validate :at_least_18
    validate :email_domain
    
    has_many :posts
    has_many :comments
    belongs_to :profile
    
    def email_domain
      if not email.ends_with?("ryanbrunner.ca")
        errors.add(:email, "must be from ryanbrunner.ca")          
      end
    end
    
    def at_least_18
      if date_of_birth > 18.years.ago
        errors.add(:date_of_birth, "must be at least 18") 
      end
    end
end
