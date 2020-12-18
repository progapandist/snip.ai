Rails.application.routes.draw do
  root to: "pages#home", as: :home
  resources :snippets, only: [:create, :show]
end
