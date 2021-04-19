class Brewery < ApplicationRecord

    scope :has_bears, -> { where("name LIKE '%Bear%'") }

    scope :search, -> (params){ where("name LIKE ?", "%#{params[:search]}%")}

    validates :name, presence: true, uniqueness: true

    has_many :brewery_reviews
    has_many :users, through: :brewery_reviews
    
end