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

ActiveRecord::Schema.define(:version => 20120429092526) do

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
    t.boolean  "to_public",     :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "approved_by"
  end

  add_index "resources", ["approved_by"], :name => "index_resources_on_approved_by"
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
