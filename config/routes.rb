Rails.application.routes.draw do
  devise_for :users

  resources :applications do
    resources :effects
    resources :collections
  end

  root 'applications#index'
end
