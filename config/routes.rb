Rails.application.routes.draw do
  root 'top#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
