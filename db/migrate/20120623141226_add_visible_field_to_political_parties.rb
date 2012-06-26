class AddVisibleFieldToPoliticalParties < ActiveRecord::Migration
  def change
    add_column :political_parties, :visible, :boolean
  end
end
