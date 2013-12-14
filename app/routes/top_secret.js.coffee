TopSecretRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.findAll 'user'

`export default TopSecretRoute`
