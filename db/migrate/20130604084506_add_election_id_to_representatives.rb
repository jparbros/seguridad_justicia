class AddElectionIdToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :election_id, :integer
  end
end
