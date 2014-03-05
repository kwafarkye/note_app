class UsersController < ApplicationController

	respond_to :json

	def index
		@users = User.all
	end

	def show
		
	end

end