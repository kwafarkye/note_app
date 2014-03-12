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

# Default serializer for the application
# Set config type stuff here (camelization of stuff, etc..)
NoteApp.ApplicationSerializer = DS.RESTSerializer.extend()

NoteApp.UserSerializer = DS.RESTSerializer.extend		
	#extractMeta: (store, type, payload) ->
	#	console.log('Here Now')
	#	return @._super(store, type, payload)

	extractArray: (store, type, payload, id, requestType) ->
		console.log('Hello')
		console.log(payload)
		return @._super(store, type, payload, id, requestType)

	extractSingle: (store, type, payload, id, requestType) ->
		console.log('Single extraction')
		# Make a hash and add user as a key
		user_payload = {}
		user_payload['user'] = payload
		console.log(user_payload)
		return @._super(store, type, user_payload, id, requestType)


	#extract: (store, type, payload, id, requestType) ->
	#	console.log(requestType)
	#	console.log(payload)
	#	if requestType == 'findAll'
	#		users_payload = {}
	#		console.log('Find All Request')
	#		users_payload['users'] = payload.users
	#		console.log('Done')
	#		console.log(users_payload)
	#		console.log('Extract Meta')
	#		meta_payload = payload.meta
	#		@extractMeta(store, type, meta_payload)
	#		return @extractArray(store, type, users_payload, id, requestType)

NoteApp.Store = DS.Store.extend
	adapter: NoteApp.RESTAdapter