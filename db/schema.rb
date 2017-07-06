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

ActiveRecord::Schema.define(version: 20170706212113) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["imageable_id", "created_at"], name: "index_answers_on_imageable_id_and_created_at"
    t.index ["imageable_type", "imageable_id"], name: "index_answers_on_imageable_type_and_imageable_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_comments_on_imageable_type_and_imageable_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "tittle"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "tags"
    t.index ["created_at"], name: "index_questions_on_created_at", unique: true
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activation",        default: false
    t.datetime "activated_at"
  end

end
