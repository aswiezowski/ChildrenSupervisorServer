Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'pages#main'
  devise_for :parents, :controllers => { registrations: 'registrations' }
  resources :parents, only: :show do
    resources :children do
      resources :tasks
    end
  end
end
