EmbersWedding::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'pages#landing'
  root 'pages#landing'

  get 'save-the-date' => 'pages#save_the_date'
  get 'home' => 'pages#home'
  get 'about-us' => 'pages#about_us'
  get 'proposal' => 'pages#proposal'
  get 'bridal-party' => 'pages#bridal_party'
  get 'wedding-details' => 'pages#wedding_details'
  get 'hotel-info' => 'pages#hotel_info'
  get 'rsvp' => 'pages#rsvp'
  get 'RSVP' => 'pages#rsvp'
  get 'rsvp-confirm' => 'pages#rsvp_confirm'
  post 'rsvp-confirm' => 'pages#rsvp_confirm'
  get 'registry' => 'pages#registry'
  get 'things-to-do' => 'pages#things_to_do'
  
  get 'export-guests' => 'guests#export'

  resources :guests
  resources :invitations

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
