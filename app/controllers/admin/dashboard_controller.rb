class Admin::DashboardController < AdminController

  def index
    @user = current_user
  end






end
