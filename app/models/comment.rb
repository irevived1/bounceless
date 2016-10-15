class Comment < ApplicationRecord
  validates :title,:body, presence: true
  belongs_to :issue
  belongs_to :faculty, foreign_key: :user_id, class_name: 'User'

  def dept_status
    issue.dept_status
  end

  def dept_id
    issue.dept_id
  end

  def dept_status=(status)
    issue.dept_status = status
    if status != 'resolve'
      issue.status = status
    end
    issue.save
  end

  def dept_id=(dept_id)
    unless dept_id == issue.dept_id
      issue.dept_id = dept_id
      issue.status = "transfer"
      issue.bounce_counter += 1
      # Issue.find_by(id:issue.id).update(:bounce_counter => (bounce_counter + 1))
      issue.save
    end
  end
end
