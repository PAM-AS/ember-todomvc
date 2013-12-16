`import Resolver from 'resolver'`

App = Ember.Application.extend
  LOG_ACTIVE_GENERATION: true
  LOG_MODULE_RESOLVER: true
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true
  modulePrefix: 'appkit' # TODO: loaded via config
  Resolver: Resolver['default']

  ready: ->
    @set 'appId', '178730775657812'

App.initializer
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
        @_super serverSession
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

Ember.RSVP.configure 'onerror', (error) ->
  # ensure unhandled promises raise awareness.
  # may result in false negatives, but visibility is more important
  if error instanceof Error
    Ember.Logger.assert false, error
    Ember.Logger.error error.stack


`export default App`
