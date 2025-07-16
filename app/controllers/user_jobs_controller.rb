class UserJobsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
    if current_user == @user
      @jobs = @user.jobs
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
