class BreweryReview < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true, length: {maximum: 400}
    belongs_to :user
    belongs_to :brewery
    
end