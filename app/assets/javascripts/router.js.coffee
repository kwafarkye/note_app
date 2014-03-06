# For more information see: http://emberjs.com/guides/routing/

NoteApp.Router.map ()->
	@resource 'users', {path: '/'}, ->
		@route 'show', {path: '/users/:user_id'}
	#		path: '/:user_id'
	#@route 'users', path: '/'
  # @resource('posts')

NoteApp.UsersRoute = Ember.Route.extend
	model: -> NoteApp.User.find()

NoteApp.UserRoute = Ember.Route.extend
	model: (params) ->
		Ember.$.getJSON('/users/'+params.user_id)