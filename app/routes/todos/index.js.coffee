TodosIndexRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @modelFor 'todos'

`export default TodosIndexRoute`
