class SessionsController < ApplicationController 
    
    def new 
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid username or password. Please try again" 
            redirect_to root_path, alert: "Invalid username or password. Please try again."
        end
    end

    def destroy 
        session.delete(:user_id)
        redirect_to root_path
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to '/login'
        end
    end

    private
    def auth 
        request.env['omniauth.auth']
    end
end