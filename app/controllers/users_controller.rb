class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def edit
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params)
      
        if @user.save
          redirect_to new_user_path
        else
          render :new, status: :unprocessable_entity
        end
    end
    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            flash[:notice] = "User was successfully updated."
            redirect_to user_path
        else
          render :edit
        end
    end
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
  