# TODO: Make sure this will work. Might possibly need to go into some other file

UsersNewController = Ember.ObjectController.extend
  actions:
    createUser: ->
      user = @get 'model'
      user.save().then ((user) =>
        @get('session').setup(user._data)
        @send 'loginSucceeded'
      ), (xhr, status, error) =>
        @send 'loginFailed', xhr, status, error

`export default UsersNewController`
