class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.user :references
      t.proposal :references

      t.timestamps
    end
  end
end
