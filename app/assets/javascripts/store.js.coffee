# http://emberjs.com/guides/models/using-the-store/
NoteApp.RESTAdapter = DS.RESTAdapter.extend
	namespace: 'ember_api/v0' # Set url namespace
	headers:
		APIKEY: "Note App API Key"
	defaultSerializer: DS.RESTSerializer.extend
		primaryKey: (type) ->
			'id'

NoteApp.UserAdapter = NoteApp.RESTAdapter.extend
	defaultSerializer: NoteApp.UserSerializer

NoteApp.NoteAdapter = NoteApp.RESTAdapter.extend
	createRecord: (store, type, record) ->
		#console.log store
		#console.log type
		#console.log record.get('user.id')
		#console.log record.get('note_content')
		# Get the id of the user
		id = record.get('user.id')
		# Construct the url
		url = @buildURL('user', id) + '/notes'
		data = @serialize(record, includeId: true)
		console.log url
		# Submit our own ajax POST
		@ajax(url, "POST", {data: data})
	defaultSerializer: NoteApp.NoteSerializer

# Default serializer for the application
# Set config type stuff here (camelization of stuff, etc..)
NoteApp.ApplicationSerializer = DS.RESTSerializer.extend()

NoteApp.NoteSerializer = DS.RESTSerializer.extend	
	extractArray: (store, type, payload, id, requestType) ->
		console.log 'Extract Array NOTE'
	extractSingle: (store, type, payload, id, requestType) ->
		console.log 'Extract Single NOTE'
	serializeHasMany: (record, json, relationship) ->
		console.log 'Serialize Has Many NOTE'
	serializeBelongsTo: (record, json, relationship) ->
		console.log 'Serialize Belongs To NOTE'


NoteApp.UserSerializer = DS.RESTSerializer.extend		
	extractArray: (store, type, payload, id, requestType) ->
		console.log 'Array Extraction'
		users_arr = []
		notes_payload = []
		# Extract the notes from the payload
		user_payload = payload.users
		# Iterate through each user and
		# extract the note info
		user_payload.forEach (user) ->
			note_id_arr = []
			# Get the notes array from this user
			tmp_notes_payload = user.notes
			# Go through each note and add to our notes array
			user.notes.forEach (user_note) ->
				# MAYBE: Get the user_id from the note and put in array
				# Add note to notes payload
				notes_payload.push(user_note)
				# Add the id to our note array
				note_id_arr.push(user_note.id)
			# Set the user notes to the id array
			user.notes = note_id_arr
		payload = {users: user_payload, notes: notes_payload}
		return @._super(store, type, payload, id, requestType)

	extractSingle: (store, type, payload, id, requestType) ->
		console.log('Single extraction')
		# Make a hash and add user as a key
		user_payload = payload #{ user: payload }
		notes_payload = []
		notes_arr_id = []
		console.log user_payload.notes.length
		# Run through notes and extract notes
		unless user_payload.notes == undefined
			user_payload.notes.forEach (note) ->
				console.log note
				notes_payload.push(note)
				notes_arr_id.push(note.id)
				console.log note.id
			# Set the user notes to the id array
			user_payload.notes = notes_arr_id
		payload = {user: user_payload, notes: notes_payload }
		console.log payload
		return @._super(store, type, payload, id, requestType)
	serializeHasMany: (record, json, relationship) ->
		console.log 'Serialize Has Many USER'
	serializeBelongsTo: (record, json, relationship) ->
		console.log 'Serialize Belongs to USER'

NoteApp.Store = DS.Store.extend
	adapter: NoteApp.RESTAdapter