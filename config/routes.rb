Rails.application.routes.draw do

  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/edit'
  #
  # get 'users/create'
  #
  # get 'users/update'
  #
  # get 'users/destroy'
  #
  # get 'users/change_avatar'
  #
  # get 'users/import'

  get 'homes/index'

  get 'password_resets/new'

  get 'reminders/write_email'
  post 'reminders/send_email'

  # get 'dashboards/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # resources :admins

  resources :users do
    collection { post :import }
    member do
      get "change_avatar"
    end
  end

  resources :assignments do
    collection { post :import }
  end

  resources :homeworks
  resources :password_resets

  root 'dashboards#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
