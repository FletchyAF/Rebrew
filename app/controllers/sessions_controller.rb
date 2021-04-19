class SessionsController < ApplicationController

    def new
      @errors = []
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to breweries_path
      elsif @user
        flash[:message] = "Invalid Password"
        render :new
      else
        flash[:message] = "Invalid Username"
        render :new
      end
    end
  
    def create_with_google
      @user = User.find_or_create_by(uid: google_auth['uid'], provider: google_auth['provider']) do |user|
       user.username = google_auth['info']['email'] 
       user.password = SecureRandom.hex(16)
      end

      if @user.valid?
        session[:user_id] = @user.id
        redirect_to breweries_path
      else
        redirect_to '/signup'
      end
    end
  
    def destroy
      session.clear
      redirect_to '/signup'
    end

    private

    def google_auth
      request.env['omniauth.auth']
    end
  
  end