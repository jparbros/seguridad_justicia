class AddComissionsToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :comissions, :text
  end
end
