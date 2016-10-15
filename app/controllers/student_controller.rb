class StudentController < ApplicationController
	def track_all_issue
		@issues = Issue.all

		respond_to do |format|
      format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
      format.json { render json: @issues }
    end
	end
end
