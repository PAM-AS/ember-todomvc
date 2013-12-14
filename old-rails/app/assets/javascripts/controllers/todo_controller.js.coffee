App.TodoController = Ember.ObjectController.extend
  isCompleted: ((key, value) ->
    model = @get 'model'

    if value == undefined
      # Property being used as a getter
      return model.get 'isCompleted'
    else
      # Property being used as a setter
      model.set 'isCompleted', value
      model.save()
      return value

  ).property 'model.isCompleted'

  isEditing: false

  actions:
    editTodo: ->
      @set 'isEditing', true

    acceptChanges: ->
      @set 'isEditing', false

      if Ember.isEmpty(@get 'model.title')
        @send 'removeTodo'
      else
        @get('model').save()

    removeTodo: ->
      todo = @get 'model'
      todo.deleteRecord()
      todo.save()
