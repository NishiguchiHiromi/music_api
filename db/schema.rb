# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180218043017) do

  create_table "musics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "no", null: false
    t.string "title", default: "no-title"
    t.string "composer", default: "no-composer"
    t.string "source", default: "no-source"
    t.string "meter", default: "4/4"
    t.string "note_length", default: "1/64"
    t.string "tempo", default: "1/4=80"
    t.string "reference"
    t.string "key", default: "C"
  end

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "music_id", null: false
    t.integer "bar_order", null: false
    t.integer "note_order", null: false
    t.string "note", default: "C"
    t.integer "length", default: 8
  end

end
