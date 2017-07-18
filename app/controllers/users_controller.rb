class UsersController < ApplicationController


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attribute(:reputation,0)
       @user.update_attribute(:age,"No definido")
       @user.update_attribute(:gender,"No definido")
        @user.update_attribute(:country,"No definido")
        @user.update_attribute(:qvalidation,{})

      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Revisa tu email para activar tu cuenta"
      redirect_to root_url

    else
      render 'new'
    end
  end


  def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation,:age,:gender,:country)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   

    if @user.update_attributes(user_params)
      flash[:info] = "Se han cambiado los datos"
      redirect_to root_url
    else
      render 'edit'
    end
  end


end
