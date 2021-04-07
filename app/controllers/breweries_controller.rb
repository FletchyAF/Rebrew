class BreweriesController < ApplicationController
    before_action(:require_login)
    layout "application"

    def index
        @breweries = Brewery.all
    end

    def show
        @brewery = Brewery.find_by(id: params[:brewery_id])
    end

    def new
        @brewery = Brewery.new(brewery_params)
      end
    
    def create
        @brewery = Brewery.new(brewery_params)
        if @brewery.save
            redirect_to brewery_path(@brewery)
        else
          render :new
        end
      end
end