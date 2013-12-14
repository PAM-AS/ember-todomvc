App.TodosController = Ember.ArrayController.extend

  remaining: (->
    @filterBy('isCompleted', false).get 'length'
  ).property '@each.isCompleted'

  inflection: (->
    remaining = @get 'remaining'
    if remaining == 1 then 'item' else 'items'
  ).property 'remaining'

  actions:
    createTodo: ->
      # Get the todo title set by the "New Todo" text field
      title = @get 'newTitle'
      return unless title.trim()

      # Create the new Todo record
      todo = @store.createRecord 'todo',
        title: title
        isCompleted: false

      # Clear the "New Todo" text field
      @set 'newTitle', ''

      todo.save()

    clearCompleted: ->
      completed = @filterBy 'isCompleted', true
      completed.invoke 'deleteRecord'
      completed.invoke 'save'

  hasCompleted: (->
    @get('completed') > 0
  ).property 'completed'

  completed: (->
    @filterBy('isCompleted', true).get 'length'
  ).property '@each.isCompleted'

  allAreDone: ((key, value) ->
    if value == undefined
      !!@get('length') and @everyBy 'isCompleted', true
    else
      @setEach 'isCompleted', value
      @invoke 'save'
      value
  ).property '@each.isCompleted'
