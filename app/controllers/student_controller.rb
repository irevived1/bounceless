class StudentController < ApplicationController
  before_action :authenticate_user!, :except => [:departments]

  def departments
    @departments = Department.all
    respond_to do |format|
      format.html { render 'issues/departments' }
      format.json { render json: @departments }
    end
  end#

end
