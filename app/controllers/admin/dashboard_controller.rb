class Admin::DashboardController < AdminController
  before_action :is_admin?

  def index
    @user = current_user
  end



  private

  def is_admin?
    #A moins que le user ne soit un admin, on le redirige vers l'accueil
    unless current_user.is_admin == true
      redirect_to root_path
    end

  end


end
