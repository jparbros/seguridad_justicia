class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :district_number
      t.text :sections
      t.integer :site_id

      t.timestamps
    end
  end
end
