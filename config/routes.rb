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
    resources :questions
    resources :document_topics, only: [:index]
    resources :representatives do
      resources :stances
    end
    resources :tracings
    resources :news
    resources :candidates do
      resources :anwsers
    end

    root :to => "dashboard#show"
  end


  match '/seguimientos/temas/:tema' => 'seguimientos#index', as: :seguimientos_temas
  match '/seguimientos/tipo/:tipo' => 'seguimientos#index', as: :seguimientos_tipos
  
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
  resources :seguimientos, only: [:index, :show]
  resources :representantes, only: [:show] do
    resources :posturas, controller: 'posicion', only: [:index, :show]
  end

  resources :respuestas, only: [] do
    resource :votes, controller: 'respuestas_votes', only: [:create]
  end

  root :to => "home#show"

  match '/posturas_partidistas' => 'posturas#index', as: :posturas
end