class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.belongs_to :site
      t.belongs_to :topic
      t.belongs_to :political_party
      t.text :content

      t.timestamps
    end
    add_index :positions, :site_id
    add_index :positions, :topic_id
    add_index :positions, :political_party_id
  end
end
