class Issue < ApplicationRecord
  has_many :comments
  belongs_to :student , foreign_key: :student_id, class_name: 'User'
  belongs_to :department, foreign_key: :dept_id, class_name: 'Department'
end
