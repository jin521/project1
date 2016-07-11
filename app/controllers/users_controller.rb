class UsersController < ApplicationController

before_action :authorise_user, :only => [:index]

def new
  @user = User.new
end


def create
    @user = User.new user_params
    if @user.save
      session[:id] = @user.id
    redirect_to root_path
    else
    render :new
    end
  end


  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorise_user
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end


end
