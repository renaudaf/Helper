class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.references :user
      t.references :project
      t.text :pitch

      t.timestamps
    end
  end
end
