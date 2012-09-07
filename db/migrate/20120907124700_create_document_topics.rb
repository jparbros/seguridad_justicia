class CreateDocumentTopics < ActiveRecord::Migration
  def change
    create_table :document_topics do |t|
      t.string :name
      t.integer :site_id

      t.timestamps
    end
  end
end
