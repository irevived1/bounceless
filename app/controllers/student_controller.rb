class StudentController < ApplicationController
	def track_all_issue
		@issues = Issue.all

		respond_to do |format|
      format.html { render 'issues/index' }
      format.json { render json: @issues }
    end
	end
end
