class AddNoteColumnToRankingsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :rankings, :note, :text 
  end
end
