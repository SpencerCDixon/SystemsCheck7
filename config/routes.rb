Rails.application.routes.draw do
  root 'welcome#index'

  resources :manufacturers, only: [:create, :new, :index, :show] do
    resources :cars, only: [:create, :new]
  end
end
