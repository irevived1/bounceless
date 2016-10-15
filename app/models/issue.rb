class Issue < ApplicationRecord
  include ActionView::Helpers::DateHelper
  has_many :comments
  belongs_to :student , foreign_key: :student_id, class_name: 'User'
  belongs_to :department, foreign_key: :dept_id, class_name: 'Department'

  def time_ago
    "#{time_ago_in_words(self.created_at)} ago"
  end
end
