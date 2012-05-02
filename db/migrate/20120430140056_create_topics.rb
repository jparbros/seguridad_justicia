class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :site_id
      t.string :kind

      t.timestamps
    end
  end
end
