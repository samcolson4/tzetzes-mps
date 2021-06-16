Rails.application.routes.draw do
  root "search#index"
  get "/mps", to: "search#index"
  get "/mps/:id", to: "search#show"
  get "/mps/:name", to: "search#show_name"
  get "/about", to: "about#index"
  get "/contact", to: "about#contact"
  get "/search", to: "search#search"

  post "/articles/api_article_input", to: "articles#create"

  resources :mps do
    resources :articles
  end
end
