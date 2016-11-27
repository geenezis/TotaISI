class CreateProjectAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :project_associations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.string :type

      t.timestamps
    end
  end
end
