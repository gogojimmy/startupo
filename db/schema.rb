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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120630134248) do

  create_table "admin_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "event_id"
  end

  add_index "assets", ["event_id"], :name => "index_assets_on_event_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "resource_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["resource_id"], :name => "index_comments_on_resource_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "cooperate_ways", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "address"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "price"
    t.boolean  "is_open",     :default => true
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "event_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["event_id"], :name => "index_images_on_event_id"

  create_table "join_event_attendee_ships", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "join_event_attendee_ships", ["event_id"], :name => "index_join_event_attendee_ships_on_event_id"
  add_index "join_event_attendee_ships", ["user_id"], :name => "index_join_event_attendee_ships_on_user_id"

  create_table "resource_admin_category_ships", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "admin_category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "resource_cooperate_way_ships", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "cooperate_way_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "resource_cooperate_way_ships", ["cooperate_way_id"], :name => "index_resource_cooperate_way_ships_on_cooperate_way_id"
  add_index "resource_cooperate_way_ships", ["resource_id"], :name => "index_resource_cooperate_way_ships_on_resource_id"

  create_table "resource_matcher_ships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "resource_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "type"
    t.string   "status",      :default => "pending"
  end

  create_table "resource_type_ships", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "resource_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "resource_type_ships", ["resource_id"], :name => "index_resource_type_ships_on_resource_id"
  add_index "resource_type_ships", ["resource_type_id"], :name => "index_resource_type_ships_on_resource_type_id"

  create_table "resource_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "resources", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "have_resource"
    t.boolean  "find_resource"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.string   "state"
    t.boolean  "to_public",      :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "assign_to"
    t.string   "title"
    t.string   "privacy"
    t.string   "contract_state"
  end

  add_index "resources", ["assign_to"], :name => "index_resources_on_approved_by"
  add_index "resources", ["user_id"], :name => "index_resources_on_user_id"

  create_table "users", :force => true do |t|
    t.boolean  "is_admin",               :default => false
    t.string   "name"
    t.string   "id_no"
    t.date     "birthday"
    t.string   "company"
    t.string   "title"
    t.string   "mobile"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "address"
    t.integer  "confirmed_by"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
