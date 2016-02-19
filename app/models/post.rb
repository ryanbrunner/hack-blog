class Post < ActiveRecord::Base
    # Validate presence - invalid if title is nil or empty
    validates :title, presence: true
    
    # Validate that this value is in a list
    validates :category, inclusion: { in: ['news', 'fun'] }
    
    # SELECT * FROM posts
    # WHERE lower(title) LIKE '%awesome%'
    # OR lower(content) LIKE '%awesome%'
    
    def self.entitled(value)
        where("lower(title) LIKE ? OR lower(content) LIKE ?", 
              "%#{value.downcase}%",
              "%#{value.downcase}%")
    end
    
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
