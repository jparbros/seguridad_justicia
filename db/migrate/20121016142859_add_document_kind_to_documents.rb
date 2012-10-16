class AddDocumentKindToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :document_kind, :string
  end
end
