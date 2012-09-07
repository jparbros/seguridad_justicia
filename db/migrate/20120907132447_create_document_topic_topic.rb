class CreateDocumentTopicTopic < ActiveRecord::Migration
  def up
    create_table :document_topics_documents, :id => false do |t|
      t.references :document_topic
      t.references :document
    end
  end

  def down
    drop_table :document_topics_documents
  end
end