class UsersController < ApplicationController
	require 'net/http'
	require 'json'
	def index
		display_active_plugins
		@articles = Article.all
	end

	def show
		@user = User.find_by(id: params[:id])
		if @user.nil?
			redirect_to error_path
		end
	end

	def display_active_plugins
		uri = URI.parse("http://127.0.1.1/site_1/wp-load.php")
		params = { 'api_call' => '1' }
		uri.query = URI.encode_www_form(params)
		@response = Net::HTTP.get_response(uri)
	end

end
