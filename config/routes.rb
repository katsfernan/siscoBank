Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => "users/registrations"
  }

  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  root 'static_pages#landing_page'
end
