class Api::EmberApi::V0::UsersController < Api::EmberApi::EmberApiController
	# Check the request header before every request
	before_action :ember_api_header_check

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

end