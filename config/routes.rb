Rails.application.routes.draw do
    # scope "(:locale)", locale: /en|de/ do
    # Devise routes with locale prefix
    devise_for :users, path: "", path_names: {
      sign_in: "login",
      sign_out: "logout",
      sign_up: "register"
    }

    # Homepage
    root "home#index"
    get "home/index", to: "home#index"
    resources :jobs
  # Resources
  resources :users do
    resources :jobs, only: [ :index ], controller: "user_jobs"

    get "sessions/new"
    get "sessions/create"

    # Health check and PWA
    get "up" => "rails/health#show", as: :rails_health_check
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  end
end
