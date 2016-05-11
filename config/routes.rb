Rails.application.routes.draw do
  resources :commercials
  devise_for :users

  resources :applications do
    resources :effects, except: :index do
      get 'small_icon', on: :member
      get 'small_icon_2', on: :member
      get 'large_icon', on: :member
      get 'large_icon_2', on: :member
      get 'assets_ios', on: :member
      get 'assets_android', on: :member
      get 'page_for_printing', on: :member
      get 'tmp1', on: :member
      get 'tmp2', on: :member
    end
    resources :collections, except: :index do
      get 'small_icon', on: :member
      get 'small_icon_2', on: :member
      get 'medium_icon', on: :member
      get 'medium_icon_2', on: :member
      get 'large_icon', on: :member
      get 'large_icon_2', on: :member
    end
  end

  root 'applications#index'
end
