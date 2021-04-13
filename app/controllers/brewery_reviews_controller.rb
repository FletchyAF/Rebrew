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
        @breweryReview = BreweryReview.new(brewery_review_params)
        @breweryReview.brewery_id = params[:brewery_id]
        @breweryReview.user = current_user
        if @breweryReview.save
            redirect_to brewery_review_path(@breweryReview)
        else
            redirect_to new_brewery_brewery_review_path
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
        @breweryReview = BreweryReview.find_by(id: params[:id])
        binding.pry
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
        params.require(:brewery_review).permit(:title, :content)
    end

end
