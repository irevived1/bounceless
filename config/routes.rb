Rails.application.routes.draw do
  resources :issues
  devise_for :users
  
  scope :student do
	  get 'issues' => 'student#track_all_issue'
	end
end
