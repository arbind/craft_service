CraftService::Application.routes.draw do

  namespace :api do namespace :v1 do
    post '/materialize', to: 'crafts#materialize', as: :materialize, defaults: { format: 'json' }
    unless Rails.env.production? # disable resourse routes in production
      resources :crafts, defaults: { format: 'json' }
    end
  end end

end
