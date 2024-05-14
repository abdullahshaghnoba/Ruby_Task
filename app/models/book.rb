class Book < ApplicationRecord

    filterrific(
        
    available_filters: [
      
        :search_query,
        :search_release_date,
        :search_author_name
        ]
    )

    def self.search_query(query)
    where('name LIKE ?', "%#{query}%")
    end

    def self.search_release_date(query)
        # puts query
        where('release_date = ?', "%#{query}%")
    end

    def self.search_author_name(query)
        joins(:author).where('authors.name LIKE ?', "%#{query}%")
    end

    validates :name, uniqueness: true
    validates :release_date, comparison: { less_than: -> { Date.current } }
    belongs_to :author
end
