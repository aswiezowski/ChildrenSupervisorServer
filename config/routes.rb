Rails.application.routes.draw do
  devise_for :parents
  root 'pages#main'
end
