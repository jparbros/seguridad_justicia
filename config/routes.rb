SeguridadJusticia::Application.routes.draw do

  get "elections/index"

  get "elections/new"

  ComfortableMexicanSofa::Routing.admin   :path => '/admin/cms'
  
  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  namespace :admin do
    resources :blacklists
    resources :banners
    resources :admins
    resources :debates
    resources :events, only: [:index, :new, :edit, :create, :update, :destroy]

    namespace :events do
      resources :posts do
        member do
          get :publish
          get :unpublish
        end
      end
    end
    
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
    
    resource :configurations
    resources :elections do
      member do
        get :activate
        get :deactivate
      end
    end

    root :to => "dashboard#show"
  end


  match '/seguimientos/temas/:tema' => 'seguimientos#index', as: :seguimientos_temas
  match '/seguimientos/tipo/:tipo' => 'seguimientos#index', as: :seguimientos_tipos
  
  match '/noticias/categorias/:categoria' => 'noticias#index', as: :noticias_categorias
  match '/noticias/archivo/:fecha' => 'noticias#index', as: :noticias_archivo
  
  match '/events/categorias/:categoria' => 'eventos#index', as: :eventos_categorias
  match '/events/archivo/:fecha' => 'eventos#index', as: :eventos_archivo
  
  resources :frases
  namespace :events do
    resources :posts, only: [:show, :index]
  end
  resources :events, only: [:show, :index], controller: 'eventos'
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
  
  match '/secciones/busqueda' => 'secciones#busqueda'
  resources :secciones, only: [:show]
  resources :distritos, only: [:show]

  resources :respuestas, only: [] do
    resource :votes, controller: 'respuestas_votes', only: [:create]
  end

  root :to => "home#show"

  match '/posturas_partidistas' => 'posturas#index', as: :posturas

  ComfortableMexicanSofa::Routing.content :path => '/', :sitemap => false
end