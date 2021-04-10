class BreweryReviewsController < ApplicationController
    before_action(:require_login)
    layout "application"

    def index
        @breweryReviews = BreweryReview.all
    end

    def show
        @breweryReview = BreweryReview.find(params[:id])
    end

    def new
        @breweryReview = BreweryReview.new
    end

    def create
        @breweryReview = BreweryReview.new(brewery_review_params)
        if @breweryReview.save
            redirect_to brewery_review_path(@breweryReview)
        else
          render :new
        end
    end

    def update

    end
    
    private

    def brewery_review_params
        params.require(:brewery_review).permit(:title, :content)
    end

end
