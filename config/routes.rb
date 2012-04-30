SeguridadJusticia::Application.routes.draw do

  get "topics/index"

  get "topics/new"

  get "topics/edit"

  get "events/index"

  get "events/show"

  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  namespace :admin do
    resources :blacklists
    resources :banners
    resources :admins
    resources :debates
    resources :events
    resources :political_parties
    resources :topics

    root :to => "dashboard#show"
  end

  resources :frases
  root :to => "home#show"

  match '/proyecto' => 'proyectos#index', as: :proyectos
end