class RemoveMeasurementsFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :measurements
  end
end
