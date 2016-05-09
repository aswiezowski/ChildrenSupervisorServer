Rails.application.routes.draw do
  root 'pages#main'
  devise_for :parents
  get 'parents/:id', to: 'parents#show', as: 'parent'
end
