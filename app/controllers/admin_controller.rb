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
  end

  def show
  end
end
