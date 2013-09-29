CraftService::Application.routes.draw do
  show_crafts = !Rails.env.production? or 'TRUE'.eql? ENV['SHOW_CRAFTS']

  namespace :api do
    namespace :v1 do

      post  '/materialize', to: 'crafts#materialize', as: :materialize  , defaults: { format: 'json' }
      patch '/materialize', to: 'crafts#materialize', as: :rematerialize, defaults: { format: 'json' }

      if true or show_crafts # disable viewing in production
        resources :crafts, defaults: { format: 'json' }
      end

    end
  end
end
