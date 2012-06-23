class ChengePoliticalPartyFieldOnCandidates < ActiveRecord::Migration
  def up
    remove_column :candidates, :political_party
    add_column :candidates, :political_party_id, :integer
  end

  def down
  end
end