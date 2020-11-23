class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user
      t.text :description
      t.string :measurements

      t.timestamps
    end
  end
end
