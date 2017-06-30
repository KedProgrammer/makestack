class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])

      logged(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash.now[:success] = "Has iniciado session correctamente"
      redirect_to root_path
    else
      flash[:danger] = "Usuario/password invalidos"
      render 'new'
    end
  end


  def destroy
    log_out if logged?
  end

end
