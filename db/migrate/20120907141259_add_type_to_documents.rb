class AddTypeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :type, :string
    remove_column :documents, :documentable_type
    remove_column :documents, :documentable_id
  end
end
