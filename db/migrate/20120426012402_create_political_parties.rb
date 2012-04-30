class CreatePoliticalParties < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string :name
      t.string :initials
      t.string :logo
      t.integer :site_id

      t.timestamps
    end
  end
end
