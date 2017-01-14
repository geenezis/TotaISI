class Task < ApplicationRecord
  belongs_to :project

  validates :title, :description, :status, :priority, presence: true
end
