class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :helper, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
