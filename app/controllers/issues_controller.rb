class IssuesController < ApplicationController
  # before_action :authenticate_user!, expect: [:create]
  before_action :set_issue, only: [:show, :edit, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    if current_user == nil
      redirect_to new_user_session_path
    else
      if current_user.role == 'student'
        @issues = Issue.where(student_id: current_user.id)
      elsif current_user.role == 'faculty'
        @issues = Issue.where(dept_id: current_user.department_id)
      else
        @issues = Issue.all
      end
      respond_to do |format|
        format.html { render 'issues/index' }
        format.json { render json: @issues }
      end
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    if current_user.role != 'student'
      @comments = @issue.comments
    end
  end

  def newDeptIssue
    if params['dept_id'] == nil
      return redirect_to choose_department_path
    end
    @issue = Issue.new(dept_id:params['dept_id'].to_i)
    render 'new'
  end

  # POST /issues
  # POST /issues.json
  def create
    #department_id is required
    @issue = Issue.new(issue_params)
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def resolve
    issue = Issue.find(params[:id])
    if issue.student_id == current_user.id 
      issue.dept_status = 'resolved'
      issue.student_status = 'resolved'
      issue.status = 'resolved'
      issue.save
    end
    redirect_to issues_path
  end

  def unresolve
    issue = Issue.find(params[:id])
    if issue.student_id == current_user.id 
      issue.status = 'reopened'
      issue.dept_status = 'reopened'
      issue.student_status = 'reopened'
      issue.save 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :body, :student_id, :dept_status, :student_status, :status, :bounce_counter,:dept_id)
    end
end
