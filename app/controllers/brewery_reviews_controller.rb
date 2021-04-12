class BreweryReviewsController < ApplicationController
    before_action :require_login
    helper_method :current_user
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
        binding.pry
        @breweryReview = BreweryReview.new(brewery_review_params)
        if @breweryReview.save
            redirect_to brewery_review_path(@breweryReview)
        else
          redirect_to new_brewery_brewery_review_path(@breweryReview)
        end
    end

    def edit

    end

    def update

    end
    
    private

    def brewery_review_params
        params.require(:brewery_review).permit(:title, :content)
    end

end
