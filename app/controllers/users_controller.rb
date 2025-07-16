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
    # Permit role only in certain cases, like in the update action (if you later add that functionality)
    if action_name == "create"
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :category, :custom_category)
    else
      # If you plan to allow role updates later, you can add the `role` here when updating an existing user
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :category, :custom_category)
    end
  end
end
