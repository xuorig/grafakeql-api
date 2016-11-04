Rails.application.routes.draw do
  resources :apis, only: [:show, :create]
end
