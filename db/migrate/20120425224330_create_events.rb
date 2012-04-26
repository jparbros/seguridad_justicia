class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :venue
      t.date :date
      t.integer :site_id

      t.timestamps
    end
  end
end
