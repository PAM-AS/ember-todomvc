App.LoginController = Ember.Controller.extend Ember.SimpleAuth.LoginControllerMixin,
  tokenRequestOptions: (identification, password) ->
    postData = [
      'grant_type=fb_access_token'
      'username_or_email=' + identification
      'password=' + password
    ]
    @makePostData postData

  facebookTokenRequestOptions: (accessToken, userID) ->
    postData = [
      'grant_type=facebook'
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

          # Redirect to add email if nonexistent
          # Redirect to todos if email is present
        ), scope: 'email,publish_actions'

      else
        @_super()
