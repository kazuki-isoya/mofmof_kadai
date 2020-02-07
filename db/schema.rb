ActiveRecord::Schema.define(version: 2020_02_07_063140) do

  create_table "near_stations", force: :cascade do |t|
    t.string "route"
    t.string "name"
    t.integer "walk_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_near_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "address", null: false
    t.integer "age", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
