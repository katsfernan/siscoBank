# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    person_type = PersonType.find(params['user']['person_type_id'])
    identifier_type = IdentifierType.find(
      params['user']['person_identifier_attributes']['identifier_type_id']
    )
    
    if person_type.name === 'Natural' && ("RIF").include?(identifier_type.name)
      redirect_to new_user_registration_path, flash: { notice: 'Natural persons cannot contains RIF document'}, status: :ok
    
    elsif person_type.name === 'Jurídica' && (["Cédula", "Pasaporte"]).include?(identifier_type.name)
      redirect_to new_user_registration_path, flash: { notice: 'Juridical persons cannot contains Cedula or Pasaporte document'}, status: :ok
    
    else
      super
    end
    
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :attribute,
        :name,
        :primaryPhone,
        :secondaryPhone,
        :person_type_id,
        person_identifier_attributes: [
          :identifier_type_id,
          :identifierNumber,
          :emissionDate,
          :expirationDate
        ]
      ]
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: [
        :attribute,
        :name,
        :primaryPhone,
        :secondaryPhone,
        :person_type_id,
        person_identifier_attributes: [
          :id,
          :identifier_type_id,
          :identifierNumber,
          :emissionDate,
          :expirationDate
        ]
      ]
    )
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   root
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
