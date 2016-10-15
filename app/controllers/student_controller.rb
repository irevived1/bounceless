class StudentController < ApplicationController

  def departments
    @departments = Department.all
    respond_to do |format|
      format.html { render 'issues/departments' }
      format.json { render json: @departments }
    end
  end#

end
