class ResetPasswordsController < ApplicationController
  before_action :get_user, only: [:edit, :update]

  def new
  end

  def create

    @user = User.find_by(email: params[:resset][:email])

    if @user
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = "Se te ha enviado un correo para que reestrablezcas tu contraseña"
      redirect_to root_url
    else
      flash[:warning] = "No se ha encontrado el correo"
      render 'new'
    end
  end

  def edit

  end

  def update

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

  def get_user
    @user = User.find_by(email: params[:email])
  end

end
