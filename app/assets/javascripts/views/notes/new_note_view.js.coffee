NoteApp.NewNoteView = Ember.View.extend
	classNames: 'new-note-shit'
	templateName: 'notes/new_note'
	tagName: 'form'

	submit: ->
		# Get the note's content
		nContent = @get('newNoteContent')
		console.log nContent
		user = @get('controller').send 'addNewNote', nContent
		@set('newNoteContent', '')
		event.preventDefault()
		false