SeguridadJusticia::Application.routes.draw do

  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  namespace :admin do
    resources :blacklists
    resources :banners
    resources :admins
    resources :debates
    resources :events
    resources :political_parties
    resources :topics
    resources :positions

    root :to => "dashboard#show"
  end

  resources :frases
  resources :eventos, only: [:show]
  resources :preguntas, only: [:create]
  root :to => "home#show"

  match '/posturas_partidistas' => 'posturas#index', as: :posturas
end