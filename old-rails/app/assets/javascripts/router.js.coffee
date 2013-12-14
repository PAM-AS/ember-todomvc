# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'
  @resource 'users', ->
    @route 'new'
  @route 'login'
  @route 'top_secret'

App.Router.reopen
  location: 'history'
