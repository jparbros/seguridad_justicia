class AddTwitterToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :twitter, :string
  end
end
