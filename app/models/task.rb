class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  validates :title, :description, :status, :priority, presence: true
end
