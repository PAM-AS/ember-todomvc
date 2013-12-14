IndexRoute = Ember.Route.extend
  model: ->
    @store.find 'post', 1

`export default IndexRoute`
