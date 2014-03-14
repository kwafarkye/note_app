# For more information see: http://emberjs.com/guides/routing/

NoteApp.Router.map ()->
	@resource 'users', {path: '/'}, ->
		@route "new", {path: '/users/new'}
		return
	@resource 'user', {path: '/users/:user_id'}, ->
		@resource 'notes'

# Configure to not mess with our url
NoteApp.Router.reopen location: 'history'

NoteApp.ApplicationRoute = Ember.Route.extend()

# Route for indexing users
NoteApp.UsersRoute = Ember.Route.extend
	activate: ->
		console.log ('Users Route')
	model: ->
		@get('store').find('user')
	renderTemplate: ->
		@render 'users/users', {
			controller: 'users',
			into: 'application',
			outlet: 'user_list'
		}	

# Transition to the Users Route
NoteApp.UsersIndexRoute = Ember.Route.extend
	beforeModel: ->
		@transitionTo('users')

NoteApp.UserRoute = Ember.Route.extend
	activate: ->
		console.log ('User Route')
	renderTemplate: ->
		# Render the users into the app outlet
		@render 'users/user', {
			into: 'application'
			outlet: 'user_list'
		}
		@render 'notes/notes', {
			into: 'users/user',
			outlet: 'user_notes_outlet'
			controller: 'notes'
		}

NoteApp.UserNotesRoute = Ember.Route.extend
	model: ->
		@get('store').find('note')

NoteApp.NotesIndexRoute = Ember.Route.extend
	model: ->
		@get('store').find('note')
	activate: ->
		console.log 'Notes index route'
	renderTemplate: ->
		@render 'notes/notes'

NoteApp.NotesNewRoute = Ember.Route.extend
	model: ->
		@get('store').createRecord('note')
	activate: ->
		console.log 'Notes New'