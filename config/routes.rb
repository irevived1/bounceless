Rails.application.routes.draw do
  get 'comment/create'

  get 'comment/destroy'

  get 'comment/update'

  resources :issues
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
