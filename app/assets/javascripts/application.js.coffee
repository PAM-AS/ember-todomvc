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
  LOG_ACTIVE_GENERATION: true
  LOG_MODULE_RESOLVER: true
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true

App.set 'appId', '178730775657812'
#= require_tree .
