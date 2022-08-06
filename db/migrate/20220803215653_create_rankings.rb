class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :rank_one_id
      t.integer :rank_two_id
      t.integer :rank_three_id
      t.integer :rank_four_id
      t.integer :rank_five_id
      t.integer :rank_six_id
      t.integer :rank_seven_id
      t.integer :rank_eight_id
      t.integer :rank_nine_id
      t.integer :rank_ten_id


      t.timestamps
    end

    add_index :rankings, :user_id
    add_index :rankings, :question_id
  end
end
