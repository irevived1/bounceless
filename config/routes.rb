Rails.application.routes.draw do
	root 'application#main'  #for redirecting to student or faculty
  resources :issues
  devise_for :users
  
  scope :student do
	  get 'issues' => 'student#track_all_issue', as: :student_issues
	end
end
