class ChangeDateFieldEventsTable < ActiveRecord::Migration
  def up
    change_column :events, :date, :datetime
  end

  def down
  end
end