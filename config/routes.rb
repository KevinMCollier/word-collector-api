Rails.application.routes.draw do
  # devise_for :users
  # root to: "pages#home"
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flashcards, only: [:index, :show, :create, :update, :destroy]
      resources :tags, only: [:index, :show, :create, :update, :destroy] do
        get :autocomplete, on: :collection
      end
    end
  end
end
