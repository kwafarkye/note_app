class Api::EmberApi::V0::NotesController < Api::EmberApi::EmberApiController
	respond_to :json

	def index
		@user = User.find(params[:user_id])
		@notes = @user.notes
	end

	def show
		@user = User.find(params[:user_id])
		@note = @user.notes.find(params[:id])
	end
	
end
