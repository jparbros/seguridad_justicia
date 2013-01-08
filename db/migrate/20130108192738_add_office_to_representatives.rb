class AddOfficeToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :office, :string
  end
end
