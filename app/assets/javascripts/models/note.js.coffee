# for more details see: http://emberjs.com/guides/models/defining-models/
NoteApp.Note = DS.Model.extend
	note_content: DS.attr 'string',
	created_at: DS.attr 'date'
	user: DS.belongsTo('user')
