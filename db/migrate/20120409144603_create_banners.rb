class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.boolean :active
      t.integer :position
      t.string :image

      t.timestamps
    end
  end
end
