NoteApp.UsersController = Ember.ArrayController.extend
	actions: {
		show_client: ->
			alert('Hello')

		alertCount: ->
			meta = @get('store').metadataFor('user')
			console.log(meta)
			alert(meta)

		# Creates and saves a new user to the db
		addNewUser: (userName, userEmail) ->
			NoteApp.User.createRecord()
			@get('store').createRecord( 'user',
				name: userName,
				email: userEmail,
				created_at: new Date()
			)
			#@get('store').commit()
	}