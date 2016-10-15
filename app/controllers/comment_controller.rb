class CommentController < ApplicationController
  before_action :authenticate_user!
  
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
end
