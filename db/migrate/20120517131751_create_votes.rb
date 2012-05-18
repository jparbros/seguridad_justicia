class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :tendency
      t.string :votable_type
      t.integer :votable_id

      t.timestamps
    end
  end
end
