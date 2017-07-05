class ResetPasswordsController < ApplicationController

  def new
  end

  def create
    byebug
    @user = User.find_by(email: params[:resset][:email])

    if @user
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = "Se te ha enviado un correo para que reestrablezcas tu contraseña"
      redirect_to root_url
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
  end

  def update
    @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        flash[:info] = "Se he reestablecido la contraseña"
        logged(@user)
        redirect_to root_url
      else
        render 'edit'
      end
  end



  def user_params
    params.require(:user).permit(:password,:password_confirmation)
  end

end