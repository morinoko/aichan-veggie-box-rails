Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ja/ do
  	root 'home#index'
  	resources :orders, only: %w{create index}
    resources :veggie_boxes, only: %w{edit update new create}
    resources :posts

  	# Login/Logout
  	get '/login', to: 'sessions#new'
  	post '/login', to: 'sessions#create'
  	delete '/logout', to: 'sessions#destroy'
  end
end
