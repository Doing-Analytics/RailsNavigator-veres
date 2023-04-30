Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :topics, only: %i[index new create show]
  scope ':topic' do
    resources :articles, only: %i[new create show destroy edit]
  end
end
