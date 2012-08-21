class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :name
      t.references :political_party
      t.string :position
      t.string :district
      t.string :email
      t.string :phone
      t.string :avatar
      t.references :commisions
      t.text :biography

      t.timestamps
    end
    add_index :representatives, :political_party_id
    add_index :representatives, :commisions_id
  end
end
