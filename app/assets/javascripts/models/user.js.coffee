NoteApp.User = DS.Model.extend
	first_name: DS.attr 'string'
	last_name: DS.attr 'string'
	email: DS.attr 'string'
	created_at: DS.attr 'date'
	notes: DS.hasMany('note')
	fullName: (->
		@get('first_name') + ' ' + @get('last_name')
	).property('first_name', 'last_name')
