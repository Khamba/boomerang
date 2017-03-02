# == Route Map
#
#        Prefix Verb   URI Pattern                             Controller#Action
#          root GET    /                                       static_pages#home
#    categories GET    /products/categories(.:format)          categories#index
#               POST   /products/categories(.:format)          categories#create
#  new_category GET    /products/categories/new(.:format)      categories#new
# edit_category GET    /products/categories/:id/edit(.:format) categories#edit
#      category GET    /products/categories/:id(.:format)      categories#show
#               PATCH  /products/categories/:id(.:format)      categories#update
#               PUT    /products/categories/:id(.:format)      categories#update
#               DELETE /products/categories/:id(.:format)      categories#destroy
#      products GET    /products(.:format)                     products#index
#               POST   /products(.:format)                     products#create
#   new_product GET    /products/new(.:format)                 products#new
#  edit_product GET    /products/:id/edit(.:format)            products#edit
#       product GET    /products/:id(.:format)                 products#show
#               PATCH  /products/:id(.:format)                 products#update
#               PUT    /products/:id(.:format)                 products#update
#               DELETE /products/:id(.:format)                 products#destroy
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

end
