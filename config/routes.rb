Rails.application.routes.draw do
  get 'entries/index'
  get 'entries/create'
  get 'entries/update'
  get 'entries/destroy'
  get 'subcategories/index'
  get 'subcategories/create'
  get 'subcategories/update'
  get 'subcategories/destroy'
  get 'categories/index'
  get 'categories/create'
  get 'categories/update'
  get 'categories/destroy'
  get 'years/index'
  get 'years/show'
  get 'years/create'
  get 'years/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :years, only: [:index, :show, :create, :update] do
    resources :categories, only: [:index, :create, :update, :destroy] do
      resources :subcategories, only: [:index, :create, :update, :destroy]
    end
    resources :entries, only: [:index, :create, :update, :destroy]
  end
end
