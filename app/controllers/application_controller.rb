class ApplicationController < ActionController::Base

    before_action :authenticate_user!
    before_action :configure_account_update_params, only: [:update]

    def after_sign_in_path_for(resource)
        dashboard_path
    end

    def configure_account_update_params
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
end
