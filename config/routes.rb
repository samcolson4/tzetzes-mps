Rails.application.routes.draw do
  devise_for :users
  root "about#index"
  get "/mps", to: "mps#index"
  get "/mps/:id", to: "mps#show"
  get "/about", to: "about#index"
  get "/contact", to: "about#contact"
  get "/search", to: "articles#search"
  get "/articles", to: "articles#index"
  get "/about/privacy", to: "about#privacy"

  unauthenticated do
    # root :to => 'about#index'
  end
 
  # authenticated do
  #   root :to => 'dashboard#index'
  # end

  namespace :api do
    resources :articles
  end

  resources :mps do
    resources :articles
  end
end
