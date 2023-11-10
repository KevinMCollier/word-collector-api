Rails.application.routes.draw do
  # devise_for :users
  # root to: "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users
      resources :tags
      resources :user_answers
      resources :learning_points do
        resources :questions do
          resources :answers
        end
      end
    end
  end
end
