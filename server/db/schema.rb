# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_230_202_024_155) do
  create_table 'categories', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'comment', null: false
    t.integer 'parent_id'
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'posts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'description', null: false
    t.text 'image_data', null: false
    t.bigint 'user_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_posts_on_category_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.text 'bio', null: false
    t.text 'image_data'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'provider'
    t.string 'uid'
    t.integer 'role'
  end

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'posts', 'categories'
  add_foreign_key 'posts', 'users'
end
