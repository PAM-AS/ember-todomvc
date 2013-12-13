DS.ActiveModelAdapter.reopen
  namespace: 'api/v1'
  host: 'http://de1.pam.as:3002'

App.ApplicationAdapter = DS.ActiveModelAdapter.extend()

App.UserSerializer = DS.ActiveModelSerializer.extend
  serialize: (user, options) ->
    # Do whatever the ActiveModelSerializer does
    json= @_super user, options

    # Add the password and password_confirmation to the json
    json.password = user.password
    json.password_confirmation = user.password_confirmation

    # Return the finished masterpiece
    json
