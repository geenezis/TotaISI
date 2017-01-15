class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  validates :title, :description, :status, :priority, presence: true
end
