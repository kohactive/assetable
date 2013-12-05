Rails.application.routes.draw do

  namespace :assetable do
    resources :assets
    resources :external_services
  end

end
