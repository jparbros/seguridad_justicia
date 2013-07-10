class ChangeSectionInRepresentatives < ActiveRecord::Migration
  def change
    change_column :representatives, :section, :text
  end
end
