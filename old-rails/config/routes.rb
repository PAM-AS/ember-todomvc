EmberTodomvc::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: "home#index"

  # API
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :todos
      resources :users, except: [:new, :edit, :destroy]
      post 'session' => 'session#create'
    end
  end

  # Send everything else to the Ember-app
  match '*path', to: 'home#index', via: [:get, :post]
end
