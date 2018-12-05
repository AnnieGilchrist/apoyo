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

  # def after_update_path_for(resource)
  #   profile_path(current_user)
  #

  private

  def organisation_params
    params.require(:user).permit(:organisation_type)
  end
end
