class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.user :references
      t.project :references
      t.text :pitch

      t.timestamps
    end
  end
end
