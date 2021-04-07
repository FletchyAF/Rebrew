class SessionsController < ApplicationController

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to breweries_path
      elsif @user
        render :new
      else
        render :new
      end
    end
  
  
    def create_with_google
      user = User.find_or_create_by(username: ) do |u|
        u.password = 'password'
      end
      if user.save
        session[:user_id] = user.id
        redirect_to breweries_path
      else
        redirect_to signup_path
      end
    end
  
    def destroy
      session.clear
      redirect_to '/signup'
    end
  
    private
  
    def google_auth
      
    end
  
  
  end