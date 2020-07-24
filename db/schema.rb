# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_24_190902) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.integer "user_id"
    t.integer "workout_id"
  end

  create_table "comments_workouts", id: false, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "workout_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.integer "height"
    t.integer "weight"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "intensity"
    t.string "duration"
  end

end
