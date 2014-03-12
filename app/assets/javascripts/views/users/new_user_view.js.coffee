NoteApp.NewUserView = Ember.View.extend
	classNames: 'coolness'
	templateName: 'users/new_user'
	tagName: 'form'

	submit: ->
		# Get the name and email
		uFName = @get('newUserFN')
		uLName = @get('newUserLN')
		uEmail = @get('newUserEmail')
		# TODO: Could perform validations here
		console.log uFName
		console.log uEmail
		# Send to controller
		@get('controller').send 'addNewUser', uFName, uLName, uEmail
		# Clear values
		@set('newUserFN', '')
		@set('newUserLN', '')
		@set('newUserEmail', '')
		false