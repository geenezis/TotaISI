class Project < ApplicationRecord
   has_many :users, through: :project_associations
   has_many :project_associations

   validates :name, presence: true
end
