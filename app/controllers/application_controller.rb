class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  

  def main
  	redirect_to issues_path
  end

end
