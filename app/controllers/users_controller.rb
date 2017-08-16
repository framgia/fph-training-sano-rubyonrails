class UsersController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def index
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Create Infomation Successfully"
            redirect_to root_url
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :avator)
        end

        def logged_in_user
            redirect_to(root_url) if session[:user_id]
        end
end

