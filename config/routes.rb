Rails.application.routes.draw do
  get 'contacts/new'

  get 'contacts/create'

  get 'properties/adding'

  get 'properties/listing'

  get 'properties/my_property', to: 'properties#my_prop'

  get 'pages/build_prog'

  get 'user_sessions/sign_in'

  get 'users/sign_up'

  get 'homes/index', to: 'homes#index'

  get 'pages/build_prog'

  get 'pages/role'

  get 'properties/booking'

  get '/booking/:id', to: 'properties#booking_confirmation'

  get '/search_prop', to: 'homes#search_prop'

  root to: 'homes#index'

  delete '/delete_prop/:id' => 'properties#delete_prop'

  get 'payments/payment'
  match '/pay', to: 'payments#pay', via: :post




  resources :users, only: [:sign_up, :create]

  resources :user_sessions, only: [:create, :destroy]


  get 'properties/adding', to: 'properties#list'
  match 'properties/adding_property', to: 'properties#adding_property', via: :post, as: :add_property


  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#sign_in', as: :sign_in
  get '/sign_up', to: 'users#sign_up', as: :sign_up



  match '/contacts',to: 'contacts#new',via: 'get'
  resources "contacts", only: [:new, :create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

require 'sidekiq/web'
Rails.application.routes.draw do
  get 'payments/payment'

  mount Sidekiq::Web => '/sidekiq'
end