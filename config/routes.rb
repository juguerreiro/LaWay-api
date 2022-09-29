Rails.application.routes.draw do
  get 'health/index'
  devise_for :users
  root to: 'pages#home'
  get("status" => "status#index")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ceps, only: [ :index, :create ]
    end
  end
end
