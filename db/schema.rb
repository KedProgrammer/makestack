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

ActiveRecord::Schema.define(version: 20170717213610) do

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.string   "imageable2_type"
    t.integer  "imageable2_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "error"
    t.string   "username"
    t.integer  "votes"
    t.integer  "questionid"
    t.index ["imageable2_type", "imageable2_id"], name: "index_answers_on_imageable2_type_and_imageable2_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "error"
    t.string   "username"
    t.index ["imageable_type", "imageable_id"], name: "index_comments_on_imageable_type_and_imageable_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "tittle"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "votes"
    t.integer  "respuestas"
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
    t.integer  "reputation"
    t.string   "country"
    t.integer  "age"
    t.string   "gender"
    t.text     "qvalidation"
  end

end
