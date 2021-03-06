class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
     @users = User.order(created_at: :desc)
  end

  private
  def authorize_admin!
    unless can?(:manage, :all)
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end
end
