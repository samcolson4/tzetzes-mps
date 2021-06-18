Rails.application.routes.draw do
  root "mps#index"
  get "/mps", to: "mps#index"
  get "/mps/:id", to: "mps#show"
  get "/about", to: "about#index"
  get "/contact", to: "about#contact"
  get "/search", to: "articles#search"

  namespace :api do
    resources :articles
  end

  resources :mps do
    resources :articles
  end
end
