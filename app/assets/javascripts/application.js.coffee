#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require localstorage-adapter
#= require ember-simple-auth
#= require ember-facebook
#= require bootstrap
#= require_self
#= require app

window.App = Ember.Application.createWithMixins Ember.Facebook,
  LOG_TRANSITIONS: true

App.set 'appId', '178730775657812'
#= require_tree .
