SeguridadJusticia::Application.routes.draw do

  get "representantes/show"

  get "noticias/index"

  get "noticias/show"

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
    resources :questions
    resources :representatives
    resources :news
    resources :candidates do
      resources :anwsers
    end

    root :to => "dashboard#show"
  end

  resources :frases
  resources :eventos, only: [:show, :index]
  resources :noticias, only: [:show, :index]
  resources :preguntas, only: [:create, :index] do
    resource :votes, only: [:create]
  end
  resources :evalua, only: [:index]

  resources :opina, only: [:index]
  resources :pregunta, only: [:index]
  resources :compara, only: [:index]
  resources :representantes, only: [:show]

  resources :respuestas, only: [] do
    resource :votes, controller: 'respuestas_votes', only: [:create]
  end

  root :to => "home#show"

  match '/posturas_partidistas' => 'posturas#index', as: :posturas
end