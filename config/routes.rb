Rails.application.routes.draw do
  get 'faculty/index'

  get 'faculty/create'

  get 'faculty/new'

  get 'faculty/destroy'

  get 'faculty/edit'

  get 'faculty/update'

  get 'faculty/show'

  get 'comment/create'

  get 'comment/destroy'

  get 'comment/update'

  resources :issues
  devise_for :users
  
  scope :student do
	  get 'issues' => 'student#track_all_issue'
	end
end


