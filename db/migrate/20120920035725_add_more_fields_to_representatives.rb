class AddMoreFieldsToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :facebook, :string
  end
end
