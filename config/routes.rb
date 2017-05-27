Rails.application.routes.draw do

  get 'students/index'

  get 'students/show'

  get 'students/new'

  get 'students/edit'

  get 'students/create'

  get 'students/update'

  get 'students/destroy'

  root 'dashboards#index'

  # get 'dashboards/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
