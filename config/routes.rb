Rails.application.routes.draw do

  root 'dashboards#index'

  # get 'dashboards/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :admins

  resources :students

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
