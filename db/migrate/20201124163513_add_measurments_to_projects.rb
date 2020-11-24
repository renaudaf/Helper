class AddMeasurmentsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :measurements, :json
  end
end
