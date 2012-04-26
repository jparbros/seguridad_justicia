class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :political_party
      t.string :image
      t.string :logo
      t.integer :site_id

      t.timestamps
    end
  end
end
