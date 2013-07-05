CraftService::Application.routes.draw do

  namespace :api do namespace :v1 do
    resources :crafts, defaults: { format: 'json' }
  end end

end
