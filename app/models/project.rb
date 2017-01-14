class Project < ApplicationRecord
   has_many :users, through: :project_associations
   has_many :project_associations, dependent: :destroy
   has_many :tasks, dependent: :destroy

   validates :name, presence: true
end
