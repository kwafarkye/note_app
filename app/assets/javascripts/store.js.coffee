# http://emberjs.com/guides/models/using-the-store/
NoteApp.RESTAdapter = DS.RESTAdapter.extend
	serializer: DS.RESTSerializer.extend
		primaryKey: (type) ->
			'id'

NoteApp.Store = DS.Store.extend
	adapter: NoteApp.RESTAdapter

NoteApp.RESTAdapter.configure("plurals", entry: "users")

#NoteApp.RESTAdapter.configure("plurals", entry: "entries")