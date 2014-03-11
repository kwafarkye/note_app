# http://emberjs.com/guides/models/using-the-store/
NoteApp.RESTAdapter = DS.RESTAdapter.extend
	namespace: 'ember_api/v0' # Set url namespace
	headers:
		APIKEY: "Note App API Key"
	serializer: DS.RESTSerializer.extend
		primaryKey: (type) ->
			'id'

# Set up an alternative adapter for the users
#NoteApp.UsersAdapter = DS.RESTAdapter.extend
#	namespace: 'ember_api/v0'
#	headers:

NoteApp.Store = DS.Store.extend
	adapter: NoteApp.RESTAdapter

NoteApp.RESTAdapter.configure("plurals", entry: "users")

#NoteApp.RESTAdapter.configure("plurals", entry: "entries")