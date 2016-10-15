Rails.application.routes.draw do
	devise_for :users
	
	root 'issues#index'  #for redirecting to student or faculty

  resources :issues
  get '/issues/:id/comment/new', to: 'comment#new', as: 'new_issue_comment'
  post '/comments', to: 'comment#create', as: 'create_comment'
  
  resources :faculty
  resources :comment
  get '/reassign-user/:id', to: 'admin#edit', as: 'reassign_user'
  get '/manage-users', to: 'admin#index', as: 'manage_users'
  patch '/reassign-user/:id', to: 'admin#update'
  
  post 'issues/newDeptIssue' => 'issues#newDeptIssue'

  post '/issue/:id/mark-resolved', to: 'issues#resolve', as: 'mark_resolved'
  post '/issue/:id/unresolve', to: 'issues#unresolve', as: 'refuse_resolved'

  scope :student do
	  get 'issues' => 'student#track_all_issue', as: :student_issues
	  get 'issues/departments' => 'student#departments', as: :choose_department
	end
end


