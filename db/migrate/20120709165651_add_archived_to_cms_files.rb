class AddArchivedToCmsFiles < ActiveRecord::Migration
  def change
    add_column :cms_files, :archived, :boolean, default: false
  end
end
