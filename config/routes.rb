Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :shows
  resources :theaters
  resources :users
  resources :reservations

  root "movies#index"

  post 'shows/:id/reserve' => 'shows#reserve'

  scope '/api' do
  	scope '/v1' do
  		get '/movies', to: 'movies#api_index'
  		get '/movies/:id', to: 'movies#api_show'
      get '/movies/:id/actors', to: 'movies#api_index_movie_actors'
  		get '/shows', to: 'shows#api_index'
  		get '/shows/:id', to: 'shows#api_show'
      get '/theaters', to: 'theaters#api_index'
  		get '/theaters/:id', to: 'theaters#api_show'
  		get '/seats/:theater_id', to: 'theaters#api_index_seats'
  		get '/reservations/:show_id', to: 'reservations#api_index_reserved_seats'
      get '/reservations/for_user/:email/:password', to: 'reservations#api_index_user_reservations'
      get '/reservations/:id/seats', to: 'reservations#api_index_reservation_seats'
      get '/shows/:id/reserve/:seats/:email/:password', to: 'shows#api_reserve_seats'
  	end
  end
  
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
