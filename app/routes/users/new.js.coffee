UsersNewRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controller.set 'model', @store.createRecord 'user'

`export default UsersNewRoute`
