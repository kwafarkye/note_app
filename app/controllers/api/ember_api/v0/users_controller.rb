class Api::EmberApi::V0::UsersController < Api::EmberApi::EmberApiController
	# Check the request header before every request
	before_action :ember_api_header_check

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		# Receiving response from ember
		@user = User.new(
			first_name: params[:user][:first_name],
			last_name: params[:user][:last_name],
			email: params[:user][:email]
		)
		# Validate and save
		if @user.save
			render :json => { :return_status => 'Success' }
		else
			response.status = 500
			render :json => { :error => 'Error Saving User'}
		end
	end


end