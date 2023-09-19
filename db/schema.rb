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

ActiveRecord::Schema[7.0].define(version: 20_230_914_015_102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'accounts', force: :cascade do |t|
    t.string 'company_name'
    t.boolean 'active', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'carriers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'url', null: false
    t.jsonb 'settings'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'parser_rules', force: :cascade do |t|
    t.string 'code'
    t.text 'description'
    t.string 'internal_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'carrier_id'
    t.index ['carrier_id'], name: 'index_parser_rules_on_carrier_id'
  end

  create_table 'shipments', force: :cascade do |t|
    t.bigint 'account_id'
    t.string 'status'
    t.string 'tracking_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.jsonb 'tracking_history', default: {}
    t.bigint 'carrier_id'
    t.string 'destination'
    t.index ['account_id'], name: 'index_shipments_on_account_id'
    t.index ['carrier_id'], name: 'index_shipments_on_carrier_id'
    t.index ['id'], name: 'index_shipments_on_id', unique: true
    t.index ['tracking_number'], name: 'index_shipments_on_tracking_number'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'encrypted_password'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'account_id'
    t.string 'role', default: 'owner'
    t.index ['account_id'], name: 'index_users_on_account_id'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
