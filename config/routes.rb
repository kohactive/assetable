Rails.application.routes.draw do

  namespace :assetable do
    resources :assets do
      post :insert, on: :collection
    end
    resources :external_services
  end

end
