Rails.application.routes.draw do

  resources :errors, except: [:new, :edit]
  resources :notifications do
    post 'push', on: :member
  end
  resources :auto_responders
  post 'technical_support/create'
  post 'device/create'

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
      get 'dat', on: :member
      get 'xml', on: :member
    end
    resources :collections, except: :index do
      get 'small_icon', on: :member
      get 'small_icon_2', on: :member
      get 'medium_icon', on: :member
      get 'medium_icon_2', on: :member
      get 'large_icon', on: :member
      get 'large_icon_2', on: :member
      get 'dat', on: :member
      get 'xml', on: :member
    end
    resources :commercials, except: :index do
      get 'image1', on: :member
      get 'image2', on: :member
    end
  end

  namespace :api do
    namespace :v1 do
      resources :applications, only: :show do
        resources :collections, only: [], controller: 'collections' do
          get 'small_icon', on: :member
          get 'small_icon_2', on: :member
          get 'medium_icon', on: :member
          get 'medium_icon_2', on: :member
          get 'large_icon', on: :member
          get 'large_icon_2', on: :member
          get 'dat', on: :member
          get 'xml', on: :member
        end
        resources :effects, only: [] do
          get 'small_icon', on: :member
          get 'small_icon_2', on: :member
          get 'large_icon', on: :member
          get 'large_icon_2', on: :member
          get 'assets_ios', on: :member
          get 'assets_android', on: :member
          get 'page_for_printing', on: :member
          get 'dat', on: :member
          get 'xml', on: :member
        end
      end
      resources :commercials, only: [] do
        get 'image1', on: :member
        get 'image2', on: :member
      end
      resources :errors, only: :create
      post 'devices/create'
      post 'technical_support/create'
    end
  end

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'applications#index'
end
