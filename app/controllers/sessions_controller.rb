class SessionsController < ApplicationController 
    
    def new 
        @user = User.new
    end

    def create
        if @user = User.find_by(name: params[:user][:username])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render 'new'
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