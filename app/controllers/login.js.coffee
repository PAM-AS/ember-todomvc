# TODO: Get FBUser from somewhere

LoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin,
  tokenRequestOptions: (identification, password) ->
    postData = [
      'grant_type=password'
      'username_or_email=' + identification
      'password=' + password
    ]
    @makePostData postData

  facebookTokenRequestOptions: (accessToken, userID) ->
    postData = [
      'grant_type=facebook_token'
      'fb_access_token=' + accessToken
      'fb_user_id=' + userID
    ]
    @makePostData postData

  makePostData: (postData) ->
    postData = postData.join '&'
    {
      type: 'POST'
      data: postData
      contentType: 'application/x-www-form-urlencoded'
    }

  makeFacebookSession: (->
    if FBUser
      user = FBUser
      requestOptions = @facebookTokenRequestOptions user.accessToken, user.id
      Ember.$.ajax(Ember.SimpleAuth.serverTokenEndpoint, requestOptions).then (response) =>
        @get('session').setup response
        @send 'loginSucceeded'
  ).observes 'FBUser'

  actions:
    loginFailed: (xhr, status, error) ->
      response = JSON.parse xhr.responseText
      @set 'errorMessage', response.error

    login: (param) ->
      if param == "facebook"
        FB.login ((response) =>
          # Make a new session
          if response.authResponse
            requestOptions = @facebookTokenRequestOptions(response.authResponse.accessToken, response.authResponse.userID)
            Ember.$.ajax(Ember.SimpleAuth.serverTokenEndpoint, requestOptions).then ((response) =>
              @get('session').setup response
              @send 'loginSucceeded'
            ), (xhr, status, error) =>
              @send 'loginFailed', xhr, status, error
        ), scope: 'email'

      else
        @_super()

`export default LoginController`
