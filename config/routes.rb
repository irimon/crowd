CrowdMoc::Application.routes.draw do

  get "relationships/create"

  devise_for :users

  get "users/new"

  get "companies/new"

  root to: 'static_pages#home'

  get "seekers/new"

  get "projects/add_new"

  resources :projects, only: [:new, :create, :destroy]
  resources :relationships, only: [:create]
  resources :users
   
  post "relationships/create"

  get "project/add_new"

  #get "static_pages/home"

  #get "static_pages/look_for_project"

  #get "static_pages/start_project"

  get "projects/show_portfolio"
  get "projects/create_demo_projects"
  get "projects/reset_demo_projects"
  get "projects/compare"
  get "projects/join"
  get "projects/unpdate_investment"
  get "projects/join"
  post "projects/join"

  # get "static_pages/about"
  
  get "static_pages/contact_company"
  
  match 'projects/unpdate_investment',  to: 'projects#show'
  
  match '/projects',  to: 'projects#search'
  match '/start_project',  to: 'projects#add_new'
  match '/show_project',  to: 'projects#show'

  match '/projects_map', to:  'projects#projects_map'
  match '/home',  to: 'static_pages#home'
   match '/about',  to: 'static_pages#about'
  match '/portfolio',  to: 'users#show_portfolio'
   match '/reports',  to: 'projects#reports'

  match '/companies_0',  to: 'static_pages#show_company_0'
   match '/companies_1',  to: 'static_pages#show_company_1'
    match '/companies_2',  to: 'static_pages#show_company_2'
 
 match '/project_1',  to: 'static_pages#show_project_1'
 match '/project_2',  to: 'static_pages#show_project_2'
  match '/project_3',  to: 'static_pages#show_project_3'
   match '/project_4',  to: 'static_pages#show_project_4'

  #  match '/signup',  to: 'users#new'
   # match '/signout', to: 'users#sign_out'
  #match '/contact_companies',  to: 'static_pages#contact_company'
  #match '/signin', to: '#'

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
