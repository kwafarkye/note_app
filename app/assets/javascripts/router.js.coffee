# For more information see: http://emberjs.com/guides/routing/

NoteApp.Router.map ()->
	@resource 'users', ->
		@route 'show',
			path: '/:user_id'
	#@route 'users', path: '/'
  # @resource('posts')

NoteApp.UsersRoute = Ember.Route.extend
	model: -> NoteApp.User.find()