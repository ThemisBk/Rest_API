Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
#get "up" => "rails/health#show", as: :rails_health_check

resources :todos do
  resources :items, only: [:create, :show, :update, :destroy]
end

post "/signup", to: "users#create"
post "/auth/login", to: "sessions#create"
get "/auth/logout", to: "sessions#destroy"

end
