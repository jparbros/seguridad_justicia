class Admin::ConfigurationsController < Admin::BaseController

  def edit
    
  end
  
  def update
    set_boolean_values
    
    params[:setting].each do |setting|
      @site.settings[setting.first] = setting.last
    end
    redirect_to edit_admin_configurations_path, notice: 'Se han actualizado las configuraciones.'
  end
  
  private
  
  def set_boolean_values
    params[:setting][:phase_1] = params[:setting][:phase_1].present?
    params[:setting][:phase_2] = params[:setting][:phase_2].present?
    params[:setting][:phase_3] = params[:setting][:phase_3].present?
    params[:setting][:phase_4] = params[:setting][:phase_4].present?
    params[:setting][:show_search] = params[:setting][:show_search].present?
    params[:setting][:show_map] = params[:setting][:show_map].present?
    params[:setting][:show_banners] = params[:setting][:show_banners].present?
  end
end
