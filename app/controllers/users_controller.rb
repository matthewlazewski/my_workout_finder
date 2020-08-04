class UsersController < ApplicationController 
    before_action :logged_in?
    
    def index 
        @users = User.all 
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
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
        if @user.id == current_user.id
            @user.update(user_params)
            redirect_to user_path(@user)
        else 
            redirect_to users_path 
        end 
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :uid, :provider, :weight, :height)
    end
end