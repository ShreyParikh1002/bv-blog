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
		url = URI.parse('http://127.0.1.1/site_1/?rest_route=/bvcount/v2/count')
		http = Net::HTTP.new(url.host, url.port)
		request = Net::HTTP::Get.new(url.request_uri)
		@response = http.request(request)
	end

end
