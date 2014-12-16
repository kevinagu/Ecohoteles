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

ActiveRecord::Schema.define(version: 20141211031251) do

  create_table "cargos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingresos", force: true do |t|
    t.integer  "producto_id"
    t.integer  "user_id"
    t.float    "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingresos", ["producto_id"], name: "index_ingresos_on_producto_id"
  add_index "ingresos", ["user_id"], name: "index_ingresos_on_user_id"

  create_table "productos", force: true do |t|
    t.string   "nombre"
    t.string   "marca"
    t.integer  "umedida_id"
    t.float    "pcosto"
    t.float    "pventa"
    t.float    "cantidad"
    t.integer  "stock"
    t.integer  "seccion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto"
  end

  add_index "productos", ["seccion_id"], name: "index_productos_on_seccion_id"
  add_index "productos", ["umedida_id"], name: "index_productos_on_umedida_id"

  create_table "salidas", force: true do |t|
    t.integer  "producto_id"
    t.integer  "user_id"
    t.float    "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salidas", ["producto_id"], name: "index_salidas_on_producto_id"
  add_index "salidas", ["user_id"], name: "index_salidas_on_user_id"

  create_table "seccions", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "umedidas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "nombre"
    t.integer  "cargo_id"
    t.string   "name"
    t.string   "foto"
  end

  add_index "users", ["cargo_id"], name: "index_users_on_cargo_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
