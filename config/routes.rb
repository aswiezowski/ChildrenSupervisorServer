Rails.application.routes.draw do
  root 'pages#main'
  devise_for :parents
  resources :parents, only: :show do
    resources :children do
      resources :tasks
    end
  end
end
