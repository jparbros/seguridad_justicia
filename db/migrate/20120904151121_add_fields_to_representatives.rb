class AddFieldsToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :circumscription, :integer
    add_column :representatives, :birthday, :date
    add_column :representatives, :substitute, :string
  end
end
