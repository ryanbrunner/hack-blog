class Post < ActiveRecord::Base
    # Validate presence - invalid if title is nil or empty
    validates :title, presence: true
    validates :category, inclusion: { in: ['news', 'fun']}, if: :trudy?
    validates :category, inclusion: { in: ['news', 'fun', 'announcements']}, if: :ryan?
    
    def trudy?
      self.author == 'trudy'
    end
    
    def ryan?
      self.author == 'ryan'
    end
    
    
    # validates :category, format: //
    
    # Validate that this is a number
    # validates :category, numericality: true
    
    # Validate that this value is in a list
    validates :category, inclusion: { in: ['news', 'fun'] }
    
    def lead
        content.to_s.first(100) + "..."
    end
    
    def to_s
        self.title
    end
    
    def by?(author)
       self.author == author
    end
    
    def same_category?(other)
       self.category == other.category
    end
end
