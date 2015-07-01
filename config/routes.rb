Rails.application.routes.draw do

  root 'home#index'

  resources :home, only: [:index]

  resources :about, only: [:index]

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:destroy, :create]
  end

  resources :users, except: [:edit, :update] do
    resources :favorites, only: [:index]
    get :edit, on: :collection
    patch :update, on: :collection
  end

  resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end

end
