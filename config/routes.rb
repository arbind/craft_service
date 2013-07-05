CraftService::Application.routes.draw do

  namespace :api do namespace :v1 do
    resources :crafts, only: [:index, :show, :create], defaults: { format: 'json' }
  end end

end
