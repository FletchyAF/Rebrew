class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    has_many :brewery_reviews
    has_many :breweries, through: :brewery_reviews
    has_secure_password

end