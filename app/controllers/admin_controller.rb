class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
  end

  def edit
    @user = User.find(params[:id])
  end

  def update  
    if authenticate(current_user.email, params[:user][:current_password])
      @user = User.find(params[:id])
      @user.update(user_params) 
      redirect_to manage_users_path
    else
      redirect_to manage_users_path, alert: "Something went wrong"
    end 
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:status, :role)
    end
    def authenticate(email, password)
      user = User.find_for_authentication(:email => email)
      user.valid_password?(password) ? user : nil
    end
end
