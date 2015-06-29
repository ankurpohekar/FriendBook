Rails.application.routes.draw do
  resources :users
  resource :user_sessions, only: [:create, :new, :destroy] 
  #get '/login_user/:id' => 'users#login_user' 
  get '/friend_list' => 'users#friend_list'
  get '/user_login/:id' => 'users#user_login'
  post '/send_friend_request/:id' => 'users#send_friend_request'
  get '/friends' => 'users#friends'
  get '/friend_request' => 'users#friend_request'
  get '/request_sent_to' => 'users#request_sent_to'
  get '/slam_book_sent_to' => 'users#slam_book_sent_to'
  post '/accept_friend_request/:id' =>'users#accept_friend_request'
  post '/reject_friend_request/:id' =>'users#reject_friend_request'
  post '/send_slam_book/:id' => 'users#send_slam_book'
  get '/slam_book_request' => 'users#slam_book_request'
  get '/fill_slam_book/:id' => 'users#fill_slam_book'
  post '/create_slambook' => 'users#create_slambook'
  get '/view_slam_book/:id' => 'users#view_slam_book'
  get 'view_slam_book_user' => 'users#view_slam_book_user'
  get '/show_profile/:id' => 'users#show_profile'
  get '/unfriend/:id' => 'users#unfriend'
  post 'find_user' => 'users#find_user'

  resources :friends
  
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
