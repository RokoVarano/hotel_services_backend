Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :services, only: %i[index create destroy]

      get 'users/:id/reservations', to: 'reservations#index'
    end
  end
end
