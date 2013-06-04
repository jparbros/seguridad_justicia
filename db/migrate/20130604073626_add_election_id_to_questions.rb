class AddElectionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :election_id, :integer
  end
end
