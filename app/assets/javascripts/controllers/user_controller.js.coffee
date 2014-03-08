NoteApp.UserController = Ember.ObjectController.extend
	time_created: (->
		current_time = new Date()
		time_ago = @get('model.created_at')
		total_time = Math.abs(current_time - time_ago)
		days = total_time / 86400000
		minutes = total_time /
		#seconds = total_time / 1000
	).property('model.created_at')