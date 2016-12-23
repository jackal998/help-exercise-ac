Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :messages do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index]
    end
  end

  root 'messages#index'
end