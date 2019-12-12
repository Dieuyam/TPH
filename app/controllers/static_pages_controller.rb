class StaticPagesController < ApplicationController
  def team
  end

  def contact

  after_create :admin_contact
  def admin_contact
    ContactMailer.admin_contact_email(admin.email).deliver_now
  end

  end
end
