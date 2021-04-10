class BreweryReview < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :content, presence: true, length: {maximum: 150}
    belongs_to :user
    belongs_to :brewery

end