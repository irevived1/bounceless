Rails.application.routes.draw do
	devise_for :users
	
	root 'application#main'  #for redirecting to student or faculty

  resources :issues
  resources :faculty
  resources :comment
  get '/reassign-user/:id', to: 'admin#edit', as: 'reassign_user'
  get '/manage-users', to: 'admin#index', as: 'manage_users'
  patch '/reassign-user/:id', to: 'admin#update'
  
  
  scope :student do
	  get 'issues' => 'student#track_all_issue', as: :student_issues
	end
end


