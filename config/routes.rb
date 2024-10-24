Rails.application.routes.draw do
  devise_for :admins
  devise_for :usuarios
  resources :membros
  resources :escalas
  resources :musicas
  resources :versaos
  resources :ministerios
  resources :usuarios
  resources :tipo_skills
  get 'home', to: 'home#index'
  root 'home#index'
  get 'carregar_versoes_musica/:musica_id', to: 'versaos#carregar_versoes_musica'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
