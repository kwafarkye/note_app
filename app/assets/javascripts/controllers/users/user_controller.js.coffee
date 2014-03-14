NoteApp.UserController = Ember.ObjectController.extend
	#needs: 'notes'

	time_created: (->
		current_time = new Date()
		time_ago = @get('model.created_at')
		total_time = Math.abs(current_time - time_ago)
		days = total_time / 86400000
		console.log days
		if days > 1
			time =  days / 1
			return "Created #{time} days ago"
		if days < 1
			time = (days * 24) / 1
			return "Created #{time} hours ago"
		# minutes = total_
		#seconds = total_time / 1000
	).property('model.created_at')

	notes: (->
		my_notes = @get('model.notes')
		console.log my_notes
		my_notes.forEach (note) ->
			console.log note._data
	).property('model.notes')

	actions: {
		addNewNote: (noteContent) ->
			event.preventDefault()
			contrl = @
			# Create a new note record
			note = @get('store').createRecord('note',
				note_content: noteContent,
				created_at: new Date(),
				user: @get('model')
			)
			console.log note
			note.save().then ( (mod) ->
				console.log('Saved')
				contrl.get('model.notes').pushObject mod
				console.log 'pushed'
			), ->
				console.log 'Error while saving'
	}