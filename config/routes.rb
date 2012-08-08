Startup::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => "resources#index"
  devise_for :users, :skip => [:sessions], controllers: {omniauth_callbacks: "omniauth_callbacks"}
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

  resources :users, :only => [:show, :edit, :update] do
    get '/resources' => "resources#index"
    get '/destroy_facebook' => "users#destroy_facebook"
  end
  resources :resources, :except => [:destroy] do
    put '/i_want_it' => 'resources#i_want_it'
  end
  resources :events, :only => [:index, :show] do
    put '/join' => 'events#join'
  end

  resources :posts, :only => [:index, :show]
  get '/about', :to => "welcome#about"

  namespace :admin do
    get '/dashboard' => "dashboards#index"
    get '/unconfirmed_users' => "users#unconfirmed_users"
    get '/unapproved_resources' => 'resources#unapproved_resources'
    get '/my_responsibility' => 'resources#my_responsibility'
    put '/confirm_user/:id' => "users#confirm_user"
    put '/upgrade/:id' => 'users#add_to_admin'
    resources :users
    resources :resources do
      get '/matchers' => 'resources#matchers'
      put '/match' => 'resources#match'
      get '/add_matcher' => 'resources#add_matcher'
      put '/update_matchers' => 'resources#update_matchers'
      resources :comments, :only => [:create]
    end
    resources :resource_types
    resources :admin_categories, :except => [:show]
    resources :events do
      get '/attendees' => 'event#attendees'
    end
    resources :posts
  end
end
