Rails.application.routes.draw do
  root 'pages#main'
  devise_for :parents
  resources :parents
end
