class ChangeProjectAssociationTypeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :project_associations, :type, :association_type_vo
  end
end
