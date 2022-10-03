Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }
  get 'users', to: 'static_pages#dashboard'
  get 'dashboard', to: 'static_pages#dashboard', as: :dashboard
  get 'dashboard/user/:id', to: 'static_pages#show', as: :userDetail
  root 'static_pages#landing_page'
end
