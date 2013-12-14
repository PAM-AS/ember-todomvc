LoginRoute = Ember.Route.extend
  # Make sure the controller doesn't keep stale data
  setupController: (controller, model) ->
    controller.setProperties
      identification: undefined
      password: undefined
      errorMessage: undefined

`export default LoginRoute`
