App.TodosRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.find 'todo'

App.TodosIndexRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @modelFor 'todos'

App.TodosActiveRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.filter 'todo', (todo) ->
      !todo.get 'isCompleted'

  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

App.TodosCompletedRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.filter 'todo', (todo) ->
      todo.get 'isCompleted'

  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller
