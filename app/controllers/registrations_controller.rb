class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    @organisation_type = organisation_params[:organisation_type]
    if @organisation_type == 'Business'
      '/businesses/new'
    elsif @organisation_type == 'Charity'
      '/charities/new'
    end
  end

  def after_update_path_for(resource)
    if current_user.organisation_type == 'Business'
      "/businesses/#{current_user.organisation_id}"
    elsif current_user.organisation_type == 'Charity'
      "/charities/#{current_user.organisation_id}"
    end
  end

  private

  def organisation_params
    params.require(:user).permit(:organisation_type)
  end
end
