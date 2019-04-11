Rails.application.routes.draw do
  resources :paintings
  resources :artists

  get "search", to: "artists#index"
  get "search_painting", to: "paintings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
