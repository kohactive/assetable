Rails.application.routes.draw do

  namespace :assetable do
    resources :assets do
      get :insert, on: :collection
    end
    resources :external_services
  end

end
