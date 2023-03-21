Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :airplanes do
    resources :reviews, only: [:create]
    collection do
      get :my_airplanes
    end
  end
  resources :inquiries, only: [:create, :index]  do
    resources :messages, only: [:create]
  end
end
