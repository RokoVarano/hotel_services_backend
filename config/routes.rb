Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :services, only: %i[index create destroy]

      get 'users/:id/reservations', to: 'reservations#index'
      post 'users/:user_id//services/:service_id/reservation',
           to: 'reservations#create'
      resources :reservations, only: [:destroy]

      resources :users, only: [:create]
      get 'users', to: 'users#log_in'
    end
  end
end
