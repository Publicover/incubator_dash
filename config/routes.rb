Rails.application.routes.draw do

  get 'reminders/write_email'
  post 'reminders/send_email'

  # get 'dashboards/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :admins

  resources :students

  resources :assignments

  root 'dashboards#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
