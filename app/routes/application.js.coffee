# TODO: Require FBUser and check the App.reset()
ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin,
  actions:
    logout: ->
      if FBUser?
        FB.logout (response) =>
          console.log "Logged out of facebook"
          @get('session').destroy()
          App.reset() # TODO: Check how this works with modules
      else
        @get('session').destroy()
        App.reset() # TODO: This one too

    # error: ->
    #   # If all else fails...
    #   @get('session').destroy()
    #   @transitionTo 'login'

`export default ApplicationRoute`
