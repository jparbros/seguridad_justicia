class ChangeSectionToRepresentatives < ActiveRecord::Migration
  def change
    change_column :representatives, :section, :string
  end
end
