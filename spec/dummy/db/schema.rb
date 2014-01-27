# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140121173312) do

  create_table "asset_attachments", force: true do |t|
    t.integer  "asset_id"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_attachments", ["asset_id"], name: "index_asset_attachments_on_asset_id"
  add_index "asset_attachments", ["assetable_id"], name: "index_asset_attachments_on_assetable_id"
  add_index "asset_attachments", ["assetable_type", "assetable_id", "name"], name: "named_asset", unique: true
  add_index "asset_attachments", ["assetable_type", "assetable_id"], name: "index_asset_attachments_on_assetable_type_and_assetable_id"

  create_table "assets", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "body"
    t.string   "filename"
    t.string   "checksum"
    t.string   "path"
    t.string   "content_type"
    t.integer  "file_size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "duration"
    t.integer  "bit_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "ratio"
  end

  create_table "galleries", force: true do |t|
    t.integer  "galleryable_id"
    t.string   "galleryable_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["galleryable_id"], name: "index_galleries_on_galleryable_id"
  add_index "galleries", ["galleryable_type", "galleryable_id", "name"], name: "named_gallery", unique: true
  add_index "galleries", ["galleryable_type", "galleryable_id"], name: "index_galleries_on_galleryable_type_and_galleryable_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
