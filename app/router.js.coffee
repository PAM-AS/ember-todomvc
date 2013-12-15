Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

Router.map ->
  @route 'component-test'
  @route 'helper-test'
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'
  @resource 'users', ->
    @route 'new'
  @route 'login'
  @route 'top_secret'

Router.reopen
  location: 'history'

`export default Router`
