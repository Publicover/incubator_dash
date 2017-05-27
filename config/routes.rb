Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'admins/index'

  get 'admins/show'

  get 'admins/new'

  get 'admins/edit'

  get 'admins/create'

  get 'admins/update'

  get 'admins/destroy'

  # get 'dashboards/index'

  root 'dashboards#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
