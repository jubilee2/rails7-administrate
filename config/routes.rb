Rails.application.routes.draw do
  namespace :admin do
      resources :articles
      resources :comments
      resources :jobs, only: [:destroy, :index, :show] do
        put :queue, on: :member
      end

      root to: "articles#index"
    end
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
