Rails.application.routes.draw do

root 'home#index'

resources :home, only: [:index]

resources :about, only: [:index]

resources :posts do
  resources :comments, only: [:create, :destroy]
end

end
