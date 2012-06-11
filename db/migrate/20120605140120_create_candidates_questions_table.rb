class CreateCandidatesQuestionsTable < ActiveRecord::Migration
  def up
    create_table :candidates_questions, :force => true do |t|
      t.integer :candidate_id
      t.integer :question_id
      t.string :answer_url
      t.string :answer_type

      t.timestamps
    end
  end

  def down
  end
end