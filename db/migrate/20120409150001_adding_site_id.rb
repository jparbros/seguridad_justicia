class AddingSiteId < ActiveRecord::Migration
  def up
    add_column :admins, :site_id, :integer
    add_column :banners, :site_id, :integer
  end

  def down
  end
end
