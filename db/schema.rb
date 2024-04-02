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

ActiveRecord::Schema[7.1].define(version: 2024_03_08_223332) do
  create_table "brands", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computer_ram_memories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "computer_id", null: false
    t.bigint "ram_memory_id", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_id"], name: "index_computer_ram_memories_on_computer_id"
    t.index ["ram_memory_id"], name: "index_computer_ram_memories_on_ram_memory_id"
  end

  create_table "computers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "processor_id", null: false
    t.bigint "mother_board_id", null: false
    t.bigint "video_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_computers_on_client_id"
    t.index ["mother_board_id"], name: "index_computers_on_mother_board_id"
    t.index ["processor_id"], name: "index_computers_on_processor_id"
    t.index ["video_card_id"], name: "index_computers_on_video_card_id"
  end

  create_table "mother_boards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "supports_intel"
    t.boolean "supports_amd"
    t.boolean "integrated_video"
    t.integer "number_of_slots"
    t.bigint "video_card_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "name"
    t.index ["video_card_id"], name: "index_motherboards_on_video_card_id"
  end

  create_table "processors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_processors_on_brand_id"
  end

  create_table "ram_memories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.integer "size_gb"
  end

  create_table "video_cards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  add_foreign_key "computer_ram_memories", "computers"
  add_foreign_key "computer_ram_memories", "ram_memories"
  add_foreign_key "computers", "clients"
  add_foreign_key "computers", "mother_boards"
  add_foreign_key "computers", "processors"
  add_foreign_key "computers", "video_cards"
  add_foreign_key "mother_boards", "video_cards"
  add_foreign_key "processors", "brands"
end
