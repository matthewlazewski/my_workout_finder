class UsersController < ApplicationController 
    def index 
        @users = User.all 
    end
    
    def new
        @user = User.new
    end

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            redirect_to root_path
        end 
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def edit 
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :uid, :provider, :weight, :height)
    end
end