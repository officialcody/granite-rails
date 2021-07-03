Rails.application.routes.draw do
  resources :tasks, except: %i[new edit], param: :slug
  resources :users, only: %i[create index]
  resources :comments, only: :create
  resources :preferences, only: %i[show update]
  resource :sessions, only: [:create, :destroy]
  root "home#index"
  get '*path', to: 'home#index', via: :all
end
