class BreweryReviewsController < ApplicationController
    before_action :require_login
    layout "application"

    def index
        @breweryReviews = BreweryReview.all
    end

    def show
        @breweryReview = BreweryReview.find(params[:id])
    end

    def new
        @brewery = Brewery.find(params[:brewery_id])
        @breweryReview = @brewery.brewery_reviews.build
    end

    def create
        @breweryReview = BreweryReview.new(brewery_review_params)
        @breweryReview.user = current_user

        if @breweryReview.save
            redirect_to brewery_review_path(@breweryReview)
        else
            render :new
        end
    end

    def edit
        @breweryReview = BreweryReview.find_by(id: params[:id])
        if current_user == @breweryReview.user
            render :edit
        else
            redirect_to brewery_review_path(@breweryReview)
        end
    end

    def update
        @breweryReview = BreweryReview.find(params[:id])
        if @breweryReview.update(brewery_review_params)
            redirect_to brewery_review_path(@breweryReview)
        else
          render :edit
        end
    end

    def destroy
       @breweryReview = BreweryReview.find(params[:id])
        if current_user == @breweryReview.user
            BreweryReview.find(params[:id]).destroy
            redirect_to breweries_path
        else
            render :show
        end
    end
    
    private

    def brewery_review_params
        params.require(:brewery_review).permit(:title, :content, :id, :brewery_id)
    end

end
