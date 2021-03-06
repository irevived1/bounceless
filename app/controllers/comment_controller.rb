class CommentController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authority
  before_action :check_admin, only: [:destroy, :update]

  def new
    @comment = Comment.new
    @issue = Issue.find(params[:id])
    @comment.issue = @issue
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      if @comment.issue.status == 'transfer'
        @comment.issue.bounce_counter += 1
        @comment.issue.save
      end
      redirect_to issue_path(@comment.issue)
    else
      @issue = Issue.find_by(id:@comment.issue.id)
      render 'new'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    issue = comment.issue
    comment.destroy
    redirect_to issue_path(issue)
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to issue_path(issue)
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :issue_id, :dept_status)
    end

    def check_authority
      unless user_signed_in? && current_user.role != 'student'
	return redirect_to root_path
      end
    end

    def check_admin
      unless user_signed_in? && current_user.role == 'admin'
	return redirect_to root_path
      end
    end
end
