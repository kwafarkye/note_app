class Api::EmberApi::V0::UsersController < Api::EmberApi::EmberApiController
	respond_to :json

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:user_id])
		redirect_to root_path
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
			render :json => { :first_name => @user.first_name, 
				:last_name => @user.last_name, 
				:email => @user.email,
				:created_at => @user.created_at,
				:id => @user.id.to_s }
		else
			response.status = 500
			render :json => { :error => 'Error Saving User'}
		end
	end


end