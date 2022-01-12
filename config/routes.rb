Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animal, only: %I[create index destroy update show]
  resources :pet, only: %I[create destroy index show]
end
