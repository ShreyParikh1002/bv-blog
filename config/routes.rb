Rails.application.routes.draw do
	root "users#index"
	resources :users do
		resources :articles do
			resources :comments
		end
	end
	get "/error", to: "articles#error_page"
	get "/login", to: "sessions#new"
	post "/sessions", to: "sessions#create"
	delete "/sessions", to: "sessions#destroy"
	get "/sessions", to: "sessions#show"
end
