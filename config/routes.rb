Rails.application.routes.draw do
<<<<<<< HEAD
  root to: 'books#index'
  
  resources :books do
    resources :reviews
  end

  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'profile' => 'static_pages#profile'
  get    'login'   => 'sessions#new'
  
  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations'}

=======

  get 'pages/index'

  get 'static/Pages'

  root to: 'pages#index'
  
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
    get  'profile' => 'static_pages#profile'
  get    'login'   => 'sessions#new'
  
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  post 'auth/identities/register', to: 'identities#new'
  get '/auth/failure', to: 'sessions#auth_failure'

  
  resources :identities
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
>>>>>>> f35313dac63ed0e3dd3a108a401f168eca043220
end
