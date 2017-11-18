Rails.application.routes.draw do
  
  
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'store#index'

end
