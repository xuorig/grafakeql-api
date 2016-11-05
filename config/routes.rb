Rails.application.routes.draw do
  resources :apis, only: [:show, :create], param: :uuid do
    member do
      post :query
    end
  end
end
