class ChangeProjectsAcceptedValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(
      :projects, :accepted, false
      )
  end
end
