class Admin::DashboardController < AdminController

  def index
    @user = current_user
  end




  def is_admin?
    #A moins que le user ne soit un admin, on le redirige vers l'accueil
    unless current_user.is_admin == true
      redirect_to root_path
    end

  end


end
