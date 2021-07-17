Rails.application.routes.draw do
  get "/products/:id", to: "products#show"
end
