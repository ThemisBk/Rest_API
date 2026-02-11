Rails.application.routes.draw do
#get "up" => "rails/health#show", as: :rails_health_check

resources :todos do
  resources :items, only: [:create, :show, :update, :destroy]
end

post "/signup", to: "users#create"
post "/auth/login", to: "sessions#create"
get "/auth/logout", to: "sessions#destroy"

end
