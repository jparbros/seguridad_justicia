class AddGenderToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :gender, :string
    add_column :representatives, :section, :integer
    add_column :representatives, :representation_type, :string
  end
end
