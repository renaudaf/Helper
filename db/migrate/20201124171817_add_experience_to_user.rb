class AddExperienceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :experience, :integer
  end
end
