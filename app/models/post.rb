class Post < ActiveRecord::Base
    def lead
        content.first(100) + "..."
    end
    
    def ==(other)
       self.title == other.title 
    end
    
    def by?(author)
       self.author == author
    end
    
    def same_category?(other)
       self.category == other.category
    end
end
