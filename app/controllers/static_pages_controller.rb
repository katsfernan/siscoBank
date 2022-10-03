class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ landing_page ]
  def landing_page
  end

  def dashboard
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @personType = PersonType.find(@user.person_type_id)
    @personIdentifier = PersonIdentifier.find_by user_id: @user.id
    @identifierType = IdentifierType.find(@personIdentifier.identifier_type_id)

    @emissionDate = @personIdentifier.emissionDate.strftime('%d-%m-%Y')
    @expirationDate = @personIdentifier.expirationDate.strftime('%d-%m-%Y')
  end
end
