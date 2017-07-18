class AccountActivationsController < ApplicationController
def edit
  user = User.find_by(email: params[:email])
  if user && !user.activation?
    user.update_attribute(:activation,true)
    user.update_attribute(:activated_at, Time.zone.now)
    logged user
    flash[:success] = "Cuenta Activada¡"
    redirect_to root_url
  else
    flash[:danger] = "link invalido"
    redirect_to root_url
    end
end

end
