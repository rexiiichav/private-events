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

ActiveRecord::Schema[7.0].define(version: 2023_09_23_232050) do
  create_table "attended_events", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_attended_events_on_attendee_id"
    t.index ["event_id"], name: "index_attended_events_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "invitee_id", null: false
    t.integer "invitation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_id"], name: "index_invites_on_invitation_id"
    t.index ["invitee_id"], name: "index_invites_on_invitee_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "attendee_id", null: false
    t.integer "attended_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_rsvps_on_attended_event_id"
    t.index ["attendee_id"], name: "index_rsvps_on_attendee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attended_events", "events"
  add_foreign_key "attended_events", "users", column: "attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "invites", "events", column: "invitation_id"
  add_foreign_key "invites", "users", column: "invitee_id"
  add_foreign_key "rsvps", "events", column: "attended_event_id"
  add_foreign_key "rsvps", "users", column: "attendee_id"
end
