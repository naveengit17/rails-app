class UsersController < ApplicationController
    before_action :set_user, only: [:show ,:edit , :update , :destroy]
    skip_before_action :verify_authenticity_token
    def index
        @user = User.all
        #render json: @user
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "new user is created"
            redirect_to user_path(@user)
            #render :json => { success: true, user_info: @user }
        else
            render :new
            #render :json => { success: false, messages: @user.errors.full_messages }
        end
    end

    def show
        #render :json => {status: true , user_info: @user}
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] ="User was updated"
            redirect_to user_path(@user)
            #render :json => {status: true , user_info: @user}
        else
            #render :json => {status: false , messages: @user.errors.full_messages}
            render :edit
        end
    end

    def destroy
        if @user.destroy
            flash[:notice] = "user was successfully deleted"
            redirect_to users_path
            #render :json => {status: true }
        end

    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:title, :description)
    end
end