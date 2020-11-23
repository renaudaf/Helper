class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.user :references
      t.text :description
      t.string :measurements

      t.timestamps
    end
  end
end
