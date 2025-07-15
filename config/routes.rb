Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"

    scope "(:locale)", locale: /en|de/ do
    # Signup routes
    get "signup", to: "users#new", as: :signup
    post "users", to: "users#create", as: :users
    # Login routes
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy", as: "logout"

    # Homepage
    root "home#index"
    get "home/index", to: "home#index"

    get "up" => "rails/health#show", as: :rails_health_check
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  end
end
