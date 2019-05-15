Rails.application.routes.draw do
  get 'veggie_boxes/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ja/ do
  	root 'home#index'
  	resources :orders, only: %w{create}
  	get 'orders', action: :index, controller: :home

  	# Login/Logout
  	get '/login', to: 'sessions#new'
  	post '/login', to: 'sessions#create'
  	delete '/logout', to: 'sessions#destroy'
  end
end
