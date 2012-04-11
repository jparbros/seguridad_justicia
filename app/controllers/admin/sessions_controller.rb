class Admin::SessionsController < Devise::SessionsController

  before_filter :redirect_to_admin

  def redirect_to_admin
    redirect_to root_path unless request.subdomain == 'admin'
  end
end
