Rails.application.routes.draw do
  devise_for :users

  resources :applications do
    resources :effects, except: :index
    resources :collections, except: :index
  end

  root 'applications#index'
end
