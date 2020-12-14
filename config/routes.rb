Rails.application.routes.draw do
  root to: "pages#home", as: :home
  resources :prompts, only: [:create]
end
