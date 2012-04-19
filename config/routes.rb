SeguridadJusticia::Application.routes.draw do

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  get "debates/index"

  get "debates/new"

  get "debates/edit"

  get "debates/_form"

  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  namespace :admin do
    resources :blacklists
    resources :banners
    resources :admins
    resources :debates

    root :to => "dashboard#show"
  end

  resources :frases
  root :to => "home#show"
end