class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :phrase
      t.integer :site_id

      t.timestamps
    end
  end
end
