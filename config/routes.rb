Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # NOTE: $ rake routes
  # Prefix Verb URI Pattern      Controller#Action
  # v2_me GET  /v2/me(.:format) v2/me#show
  # NOTE: scope 'v2' to define the uri pattern /v2/me
  # NOTE: module: 'v2' to define the controller namespace v2/me#show
  # NOTE: as: 'v2' to define the route helper method v2_me
  scope 'v2', module: 'v2', as: 'v2' do
    get '/me' => 'me#show'
  end
end
