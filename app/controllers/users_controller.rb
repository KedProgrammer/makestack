class UsersController < ApplicationController


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Revisa tu email para activar tu cuenta"
      redirect_to root_url

    else
      render 'new'
    end
  end


  def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def show
    @user = User.find(params[:id])
  end


end
