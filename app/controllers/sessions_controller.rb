class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])

      if user.activation?
        logged user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)

        flash.now[:success] = "Has iniciado session correctamente"
        redirect_to root_path

      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Usuario/password invalidos"
      render 'new'
    end
  end


  def destroy
    log_out if logged?
    redirect_to root_path
  end

end
