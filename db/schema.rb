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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_133135) do
  create_table "cookbooks", force: :cascade do |t|
    t.string "title", default: "My cookbook", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cookbooks_on_user_id", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unity", default: "gr", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.integer "number_of_step", null: false
    t.text "description", null: false
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_instructions_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", default: 0, null: false
    t.boolean "is_vegetarian", default: false, null: false
    t.boolean "is_vegan", default: false, null: false
    t.boolean "is_kids_friendly", default: false, null: false
    t.integer "cookbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_parts", default: 1, null: false
    t.index ["cookbook_id"], name: "index_recipes_on_cookbook_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.boolean "is_confirmed", default: false
    t.string "confirmation_token"
    t.string "password_digest"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recover_password_token"
  end

end
