class BreweryReview < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true, length: {maximum: 150}
    belongs_to :user
    belongs_to :brewery
    
end