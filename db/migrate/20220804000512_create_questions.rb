class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :prompt, null: false
      t.integer :aggregate_1
      t.integer :aggregate_2
      t.integer :aggregate_3
      t.integer :aggregate_4
      t.integer :aggregate_5
      t.integer :aggregate_6
      t.integer :aggregate_7
      t.integer :aggregate_8
      t.integer :aggregate_9
      t.integer :aggregate_10



      t.timestamps
    end
  end
end
