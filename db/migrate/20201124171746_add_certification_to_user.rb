class AddCertificationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :certification, :string
  end
end
