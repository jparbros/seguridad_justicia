class Admin::AdminsController < Admin::BaseController
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @sites = Cms::Site.all.collect {|site| [site.label, site.id]}
  end

  def create
    @admin = Admin.new params[:admin]
    generated_password = Devise.friendly_token.first(6)
    @admin.password = generated_password
    if @admin.save
      AdminMailer.welcome(@admin, generated_password).deliver
      redirect_to :index
    else
      render :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.delete
    redirect_to :index
  end
end
