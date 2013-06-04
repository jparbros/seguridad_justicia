class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name
      t.boolean :active
      t.integer :site_id

      t.timestamps
    end
  end
end
