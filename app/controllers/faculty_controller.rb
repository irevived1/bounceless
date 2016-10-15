class FacultyController < ApplicationController
  before_action :must_be_faculty
  def index
    @issues = Issue.where(dept_id:current_user.department_id)
    respond_to do |format|
      format.html {return render 'issues/index'}
      format.json {return render json: @issues}
    end
  end

	def track_all_open_issue
    @issues = Issue.where("status != 'resolved' AND dept_id == #{current_user.department_id}")
		respond_to do |format|
      format.html { render 'issues/index' }
      format.json { render json: @issues }
    end
	end

  def must_be_faculty
    if ( current_user.role != 'faculty' )
      redirect_to root_path
    end
  end
end
