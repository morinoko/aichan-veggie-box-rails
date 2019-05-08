Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ja/ do
  	root 'home#index'
  	resources :orders, only: %w{create}
  end
end
