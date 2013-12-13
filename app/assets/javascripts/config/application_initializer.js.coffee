Ember.Application.initializer
  name: 'authentication'

  initialize: (container, application) ->
    # Customize the session so that it handles the additional authenticated user
    Ember.SimpleAuth.Session.reopen
      init: ->
        @_super()
        # Initialize the userId from data potentially already present in a
        # session cookie (Ember.SimpleAuth.Session does this out of the box for authToken)
        userId = (document.cookie.match(/userId=([^;]+)/) || [])[1]
        @set 'userId', userId

      setup: (serverSession) ->
        @_super(serverSession)
        @set 'userId', serverSession.user_id

      destroy: ->
        @_super()
        @set 'userId', undefined

      userIdChanged: (->
        # Save userId in a session cookie so it survives a page reload (Ember.SimpleAuth.Session
        # does this out of the box for authToken)
        document.cookie = 'userId=' + @get 'userId'
      ).observes 'userId'

      user: (->
        userId = @get 'userId'
        unless Ember.isEmpty userId
          @set 'user', container.lookup('store:main').find 'user', userId
      ).property 'userId'

    # Custom options and things
    Ember.SimpleAuth.setup container, application,
      routeAfterLogin: 'todos'
      routeAfterLogout: 'login'
      # serverTokenEndpoint: 'api/v1/session'
      serverTokenEndpoint: 'http://de1.pam.as:3003/api/v1/session'
      crossOriginWhitelist: ['http://de1.pam.as:3003']

