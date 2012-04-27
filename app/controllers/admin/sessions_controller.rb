class Admin::SessionsController < Devise::SessionsController


  def redirect_to_admin
    redirect_to root_path unless request.subdomain == 'admin'
  end
end
