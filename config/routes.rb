CraftService::Application.routes.draw do

  namespace :api do namespace :v1 do
    post '/materialize', to: 'crafts#materialize', as: :materialize, defaults: { format: 'json' }
    resources :crafts, defaults: { format: 'json' } unless Rails.env.production? # disable resource in production
  end end

end
