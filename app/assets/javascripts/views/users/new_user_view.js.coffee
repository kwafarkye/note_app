NoteApp.NewUserView = Ember.View.extend
	classNames: 'coolness'
	templateName: 'users/new_user'
	tagName: 'form'

	submit: ->
		# Get the name and email
		uName = @get('newUserName')
		uEmail = @get('newUserEmail')
		# TODO: Could perform validations here
		console.log uName
		console.log uEmail
		# Send to controller
		@get('controller').send 'addNewUser', @get('newUserName'), @get('newUserEmail')
		# Clear values
		@set('newUserName', '')
		@set('newUserEmail', '')
		false
		event.preventDefault()