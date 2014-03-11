class Api::EmberApi::EmberApiController < ApplicationController

	# Check to make sure a valid API Key is sent
	# in the request header
	def ember_api_header_check
		if request.headers["APIKEY"] == "Note App API Key"
			return true
		else
			response.status = 500
			render :json => { :error => 'API Key error'}
			# TODO: Throw expection and pass back
			# error values
			return false
		end
	end

end