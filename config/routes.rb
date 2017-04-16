# == Route Map
#
#           Prefix Verb   URI Pattern                             Controller#Action
#             root GET    /                                       static_pages#home
#       categories GET    /products/categories(.:format)          categories#index
#                  POST   /products/categories(.:format)          categories#create
#     new_category GET    /products/categories/new(.:format)      categories#new
#    edit_category GET    /products/categories/:id/edit(.:format) categories#edit
#         category PATCH  /products/categories/:id(.:format)      categories#update
#                  PUT    /products/categories/:id(.:format)      categories#update
#                  DELETE /products/categories/:id(.:format)      categories#destroy
#         products GET    /products(.:format)                     products#index
#                  POST   /products(.:format)                     products#create
#      new_product GET    /products/new(.:format)                 products#new
#     edit_product GET    /products/:id/edit(.:format)            products#edit
#          product GET    /products/:id(.:format)                 products#show
#                  PATCH  /products/:id(.:format)                 products#update
#                  PUT    /products/:id(.:format)                 products#update
#                  DELETE /products/:id(.:format)                 products#destroy
#   ethnic_dresses GET    /ethnic-dresses(.:format)               products#category_index {:category=>"Ethnic Dresses"}
#  wedding_dresses GET    /wedding-dresses(.:format)              products#category_index {:category=>"Wedding Dresses"}
#  western_dresses GET    /western-dresses(.:format)              products#category_index {:category=>"Western Dresses"}
#            login GET    /login(.:format)                        authentication#login
#                  GET    /auth/:provider/callback(.:format)      authentication#oauth_callback
#     auth_failure GET    /auth/failure(.:format)                 redirect(301, /)
#      add_to_cart POST   /add-to-cart(.:format)                  orders#add_to_cart
# remove_from_cart GET    /remove-from-cart(.:format)             orders#remove_from_cart
#        show_cart GET    /shopping-cart(.:format)                orders#show_cart
#

Rails.application.routes.draw do

  root 'static_pages#home'

  resources :products do
    collection do
      resources :categories, except: :show
    end
  end

  get 'ethnic-dresses', to: 'products#category_index', category: 'Ethnic Dresses'
  get 'wedding-dresses', to: 'products#category_index', category: 'Wedding Dresses'
  get 'western-dresses', to: 'products#category_index', category: 'Western Dresses'

  get 'login', to: 'authentication#login'
  get "/auth/:provider/callback", to: 'authentication#oauth_callback'
  get 'auth/failure', to: redirect('/')

  post 'add-to-cart', to: 'orders#add_to_cart', as: :add_to_cart
  get 'remove-from-cart', to: 'orders#remove_from_cart', as: :remove_from_cart
  get 'shopping-cart', to: 'orders#show_cart', as: :show_cart

end
