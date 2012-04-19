class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :topic
      t.integer :site_id
      t.boolean :active

      t.timestamps
    end
  end
end
