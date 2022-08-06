# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_05_000732) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "name", null: false
    t.string "image"
    t.integer "rank_count_1", default: 0
    t.integer "rank_count_2", default: 0
    t.integer "rank_count_3", default: 0
    t.integer "rank_count_4", default: 0
    t.integer "rank_count_5", default: 0
    t.integer "rank_count_6", default: 0
    t.integer "rank_count_7", default: 0
    t.integer "rank_count_8", default: 0
    t.integer "rank_count_9", default: 0
    t.integer "rank_count_10", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "score", type: :decimal, as: "((((((((((rank_count_1 * 10) + (rank_count_2 * 9)) + (rank_count_3 * 8)) + (rank_count_4 * 7)) + (rank_count_5 * 6)) + (rank_count_6 * 5)) + (rank_count_7 * 4)) + (rank_count_8 * 3)) + (rank_count_9 * 2)) + (rank_count_10 * 1))", stored: true
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt", null: false
    t.integer "aggregate_1"
    t.integer "aggregate_2"
    t.integer "aggregate_3"
    t.integer "aggregate_4"
    t.integer "aggregate_5"
    t.integer "aggregate_6"
    t.integer "aggregate_7"
    t.integer "aggregate_8"
    t.integer "aggregate_9"
    t.integer "aggregate_10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "rank_one_id"
    t.integer "rank_two_id"
    t.integer "rank_three_id"
    t.integer "rank_four_id"
    t.integer "rank_five_id"
    t.integer "rank_six_id"
    t.integer "rank_seven_id"
    t.integer "rank_eight_id"
    t.integer "rank_nine_id"
    t.integer "rank_ten_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_rankings_on_question_id"
    t.index ["user_id"], name: "index_rankings_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "email", null: false
    t.boolean "activated", default: false, null: false
    t.string "activation_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activation_token"], name: "index_users_on_activation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
