class BreweryReviews < ApplicationController
    before_action(:require_login)
    layout "application"

    def index
        @breweryReviews = BreweryReview.all
    end

    def show
        @breweryReview = BreweryReview.find_by(id: params[brewery_reviews.id])
    end

    def new
        @breweryReview = BreweryReview.new(brewery_review_params)
    end

    def create

    end

    def update

    end

end
