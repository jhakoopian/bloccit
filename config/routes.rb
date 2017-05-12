Rails.application.routes.draw do
  resources :advertisements
  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
