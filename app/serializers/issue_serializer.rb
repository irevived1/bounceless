class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :student_id, :dept_status, :student_status, :status, :bounce_counter,:dept_id
end
