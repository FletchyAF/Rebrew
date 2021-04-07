class BreweryReview < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :rating, presence: true
    validate :is_title_case
    before_validation :make_title_case
    belongs_to :user
    belongs_to :brewery

end