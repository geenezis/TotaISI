class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :estimation
      t.string :priority

      t.timestamps
    end
  end
end
