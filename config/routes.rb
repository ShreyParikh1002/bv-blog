Rails.application.routes.draw do
	root "articles#index"
	
	resources :articles do
		resources :comments
	end
	get "/error", to: "articles#error_page"
end
