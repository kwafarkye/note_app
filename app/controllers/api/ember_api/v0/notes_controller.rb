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
	
	def create
		@user = User.find(params[:user_id])
		@note = @user.notes.create(
			note_content: params[:note_content]
		)
		# Validate and save
		if @note.save
			render :json => { :return_status => 'Success' }
		else
			response.status = 500
			render :json => { :error => 'Error Saving Note'}
		end
	end

end
