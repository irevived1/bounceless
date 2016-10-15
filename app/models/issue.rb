class Issue < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :department
end
