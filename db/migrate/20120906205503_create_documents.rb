class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.string :documentable_type
      t.integer :documentable_id
      t.integer :site_id
      t.integer :representative_id

      t.timestamps
    end
  end
end
