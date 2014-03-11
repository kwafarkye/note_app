# For more information see: http://emberjs.com/guides/routing/

NoteApp.Router.map ()->
	@resource 'users', {path: '/'}
	@resource 'user', {path: '/users/:user_id'}
	#@resource 'users', {path: '/communication'}
	#		path: '/:user_id'
	#@route 'users', path: '/'
  # @resource('posts')

NoteApp.ApplicationRoute = Ember.Route.extend()

NoteApp.UsersRoute = Ember.Route.extend
	model: -> NoteApp.User.find()

NoteApp.UsersShowRoute = Ember.Route.extend
	renderTemplate: ->
		@render 'users_show'

NoteApp.UserRoute = Ember.Route.extend
	renderTemplate: ->
		@render 'user'
	model: (params) ->
		@store.find('user', params.user_id)
		#Ember.$.getJSON('/users/'+params.user_id)