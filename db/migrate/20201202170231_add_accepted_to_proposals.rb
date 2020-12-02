class AddAcceptedToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :accepted, :boolean, default: false
  end
end
