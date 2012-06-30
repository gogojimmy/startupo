Startup::Application.routes.draw do
  root :to => "resources#index"
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, :only => [:show, :edit, :update] do
    get '/resources' => "resources#index"
  end
  resources :resources, :except => [:destroy] do
    put '/i_want_it' => 'resources#i_want_it'
  end
  resources :events, :only => [:index, :show] do
    put '/join' => 'events#join'
  end

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
  end

  get '/', :to => "welcomes#index"
  get '/about', :to => "welcomes#about"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
