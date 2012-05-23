class AddVotesCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :votes_count, :integer
  end
end
