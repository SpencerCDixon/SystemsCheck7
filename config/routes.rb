Rails.application.routes.draw do
  root 'welcome#index'

  resources :manufacturers do
    resources :cars
  end
end
