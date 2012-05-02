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

  resources :p
  resources :frases
  root :to => "home#show"

  match '/proyecto' => 'proyectos#index', as: :proyectos
  match '/posturas_partidistas' => 'posturas#index', as: :posturas
end