Rails.application.routes.draw do

  get 'reminders/write_email'
  post 'reminders/send_email'

  # get 'dashboards/index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :admins

  resources :students do
    collection { post :import }
    member do
      get "change_avatar"
    end
  end

  # resources :students do
  #   collection { post :import }
  # end



  # resources :assignments do
  #   resources :homeworks
  # end

  resources :assignments do
    collection { post :import }
  end

  resources :homeworks

  root 'dashboards#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
