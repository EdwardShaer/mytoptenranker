class AddScoreToOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :options, 
    :score, 
    :virtual, 
    type: :numeric, 
    as: '(rank_count_1 * 10) + (rank_count_2 * 9) + (rank_count_3 * 8) + (rank_count_4 * 7) + (rank_count_5 * 6) + (rank_count_6 * 5) + (rank_count_7 * 4) + (rank_count_8 * 3) + (rank_count_9 * 2) + (rank_count_10 * 1)',
    stored: true 
  end
    

end
