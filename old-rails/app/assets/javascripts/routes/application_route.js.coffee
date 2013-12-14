App.ApplicationRoute = Ember.Route.extend Ember.SimpleAuth.ApplicationRouteMixin,

  actions:

    logout: ->
      if App.FBUser?
        FB.logout (response) =>
          console.log "Logged out of facebook"
          @get('session').destroy()
          App.reset()
      else
        @get('session').destroy()
        App.reset()

    # error: ->
      # If all else fails...
      # @get('session').destroy()
      # @transitionTo 'login'
