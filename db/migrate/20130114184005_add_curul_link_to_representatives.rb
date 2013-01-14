class AddCurulLinkToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :curul_link, :string
  end
end
