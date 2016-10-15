Rails.application.routes.draw do
<<<<<<< HEAD
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

=======
>>>>>>> 8c02dcaadbfe805aae750932c0a8dc55061c3d4c
  resources :issues
  devise_for :users
  
  scope :student do
	  get 'issues' => 'student#track_all_issue'
	end
end
