class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      if params[:user][:admin].to_i == 1
        @user.admin = true
        @user.save
      end
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
     params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password)
  end
end
