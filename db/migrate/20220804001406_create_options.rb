class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.integer :question_id, null: false
      t.string :name, null: false
      t.string :image
      t.integer :rank_count_1, default: 0
      t.integer :rank_count_2, default: 0
      t.integer :rank_count_3, default: 0
      t.integer :rank_count_4, default: 0
      t.integer :rank_count_5, default: 0
      t.integer :rank_count_6, default: 0
      t.integer :rank_count_7, default: 0
      t.integer :rank_count_8, default: 0
      t.integer :rank_count_9, default: 0
      t.integer :rank_count_10, default: 0

      t.timestamps
    end

    add_index :options, :question_id
  end
end
