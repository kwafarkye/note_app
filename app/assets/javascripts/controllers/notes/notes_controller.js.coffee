NoteApp.NotesController = Ember.ArrayController.extend
	needs: 'user'

	title: ->
		"Hi There"