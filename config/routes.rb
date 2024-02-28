Rails.application.routes.draw do
	devise_config = ActiveAdmin::Devise.config
	devise_config[:controllers][:omniauth_callbacks] = 'admin_users/omniauth_callbacks'
	devise_for :admin_users, devise_config
	ActiveAdmin.routes(self)
	devise_for :users

	root to: "users#index"
	resources :users do
	end
	resources :articles do
		resources :comments
	end
	get "/error", to: "articles#error_page"
end
