class CommentController < ApplicationController
  before_action :check_authority
  def new
    @comment = Comment.new
    @issue = Issue.find(params[:id])
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to issue_path(comment.issue)
    else
      render 'new'
    end
  end

  def destroy
  end

  def update
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :issue_id)
    end

    def check_authority
      unless user_signed_in? && current_user.role != 'student'
	return redirect_to root_path
      end
    end
end
