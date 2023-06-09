Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :airplanes do
    collection do
      get :my_airplanes
    end
    # resources :reviews, only: [:create]
    resources :inquiries, only: [:create, :new]
    resources :reviews, only: :create
  end
  resources :inquiries, only: [:show, :edit, :update]  do
    resources :messages, only: [:create, :update]
  end
  resources :reviews, only: :destroy
  resources :users, only: [:show]
end
