Rails.application.routes.draw do
  root "search#index"
  get "/mps", to: "search#index"
  get "/mps/:id", to: "search#show"
  get "/mps/:name", to: "search#show_name"
  get "/about", to: "about#index"

  resources :mps do
    resources :articles
  end
end