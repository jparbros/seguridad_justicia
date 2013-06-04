class AddElectionIdToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :election_id, :integer
  end
end
