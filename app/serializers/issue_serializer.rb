class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :dept_status, :student_status, :status, :bounce_counter
end
