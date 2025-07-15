class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: t("login.success")
    else
      flash.now[:alert] = t("login.failure")
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t("login.logged_out")
  end
end
