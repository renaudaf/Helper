class AddTypehelperToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :typehelper, :boolean
  end
end
