class Brewery < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    has_many :brewery_reviews
    has_many :users, through: :brewery_reviews
    
end