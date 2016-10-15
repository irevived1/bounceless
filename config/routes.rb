Rails.application.routes.draw do
	devise_for :users
	
	root 'application#main'  #for redirecting to student or faculty

  resources :issues
  resources :faculty
  resources :comment
  
  
  scope :student do
	  get 'issues' => 'student#track_all_issue', as: :student_issues
	end
end


