class ChangeMeasurements < ActiveRecord::Migration[6.0]
  def change
    change_column_default :projects, :measurements, []
  end
end
