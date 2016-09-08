Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new, :index]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new, :index]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy] do
    resources :notes, only: [:new]
  end
end
