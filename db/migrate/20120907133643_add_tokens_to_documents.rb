class AddTokensToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :topic_ids, :string
  end
end
