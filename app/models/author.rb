class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    filterrific(
        
        available_filters: [
          
          :search_query

        ]
      )

    def self.search_query(query)
        where('name LIKE ?', "%#{query}%")
    end
    validates :name, uniqueness: true
    has_many :books
end
