Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'videos/show'
      get 'videos/create'
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :notifications, only: :index
      resources :videos, only: %i[index show create]
    end
  end
end
