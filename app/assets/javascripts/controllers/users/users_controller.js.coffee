NoteApp.UsersController = Ember.ArrayController.extend
	actions: {
		
		show_client: ->
			alert('Hello')

		alertCount: ->
			meta = @get('store').metadataFor('user')
			console.log(meta)
			alert(meta)

		# Creates and saves a new user to the db
		addNewUser: (userFN, userLN, userEmail) ->
			event.preventDefault()
			# Create a new user record
			nuser = NoteApp.User.createRecord('user',
				first_name: userFN,
				last_name: userLN,
				email: userEmail
			)
			console.log(nuser.changedAttributes())
			# TODO: Validations
			# Set the attributes
			#nuser.set('first_name', userName)
			#nuser.set('last_name', userName)			
			#nuser.set('email', userEmail)
			#console.log(nuser.changedAttributes())
	}