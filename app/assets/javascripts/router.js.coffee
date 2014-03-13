# For more information see: http://emberjs.com/guides/routing/

NoteApp.Router.map ()->
	@resource 'users', {path: '/'}, ->
		@route "new", {path: '/users/new'}
		@resource 'notes', {path: '/users/:user_id/notes/'}
		return
	@resource 'user', {path: '/users/:user_id'}
	#@resource 'users', {path: '/communication'}
	#		path: '/:user_id'
	#@route 'users', path: '/'
  # @resource('posts')

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
		@render 'users', {
			controller: 'users',
			into: 'application',
			outlet: 'user_list'
		}
		console.log 'Good'
	

# Transition to the Users Route
NoteApp.UsersIndexRoute = Ember.Route.extend
	beforeModel: ->
		@transitionTo('users')

NoteApp.UserRoute = Ember.Route.extend
	# Use before model to check if
	# we want to transition
	#beforeModel: (transition) ->
	#	if 1 > 0
	#		alert('Error')
	#		transition.abort()
	#	return

	activate: ->
		console.log ('User Route')
	renderTemplate: ->
		# Render the users into the app outlet
		@render 'users', { 
			into: 'application', 
			outlet: 'user_list', 
			controller: 'users'
		}
		@render 'users/user', {
			outlet: 'myoutlet'
		}
	#model: (params) ->
	#	@store.find('user', params.user_id)
		#Ember.$.getJSON('/users/'+params.user_id)