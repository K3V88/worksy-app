class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "Signup successful!"
    else
      render :new
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :clienttype, :category, :custom_category)
  end
end
