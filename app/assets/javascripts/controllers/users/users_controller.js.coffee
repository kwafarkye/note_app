NoteApp.UsersController = Ember.ArrayController.extend
	actions: {
		show_client: ->
			alert('Hello')

		alertCount: ->
			meta = @get('store').metadataFor('user')
			console.log(meta)
			alert(meta)
	}