Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  scope "/:locale", local: /en|fr/ do 
    resources :lesson_references
    resources :glossaries
    resources :suggested_lessons
    resources :download_lists
    resources :workshops
    resources :mailing_lists
    get 'admin' => 'admin#panel'
    get 'download_mailing_list' => 'admin#download_mailing_list'
    post 'download_user_list' => 'admin#download_user_list'

    # get 'my_lesson_dashboard' => 'lesson_dashboards#index'
    resources :lesson_dashboards 
    get "my_lesson_dashboard", to: 'lesson_dashboards#index'



    root 'pages#landing_page'
    resources :lessons do
      get :autocomplete_subject_name, :on => :collection
      get :autocomplete_code_concept_name, :on => :collection
      get :autocomplete_grade_name, :on => :collection
      member do
        get "like", to: "lessons#upvote"
        get "dislike", to: "lessons#downvote"
      end
    end
    resources :profiles

    get "about" => "pages#about"
    get "home" => "pages#landing_page"
    # devise_for :users
    devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
