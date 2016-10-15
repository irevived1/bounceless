class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :faculty, foreign_key: :user_id, class_name: 'User'
end
