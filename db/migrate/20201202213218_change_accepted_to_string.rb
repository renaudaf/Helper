class ChangeAcceptedToString < ActiveRecord::Migration[6.0]
  def change
    change_column :proposals, :accepted, :string
    change_column_default :proposals, :accepted, "pending"
  end
end
