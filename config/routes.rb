Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :notifications, only: :index
      resources :videos, only: %i[index show create]
      resources :conditions, only: %i[index create]
      resources :conditions do
        resource :calculation, only: :create
      end
    end
  end
end
