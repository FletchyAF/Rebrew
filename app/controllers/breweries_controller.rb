class BreweriesController < ApplicationController
    before_action :require_login
    helper_method :current_user
    layout "application"

    def index
        @breweries = Brewery.all
    end

    def show
      @brewery = Brewery.find(params[:id])    
    end

    def new
      @brewery = Brewery.new
    end
    
    def create
        @brewery = Brewery.new(brewery_params)
        if @brewery.save
            redirect_to brewery_path(@brewery)
        else
          render :new
        end
      end

      def edit 
      end

      def destroy
        if current_user == 
          Brewery.find(params[:id]).destroy
          redirect_to breweries_path
    end

      private

      def brewery_params
        params.require(:brewery).permit(:name)
      end
end