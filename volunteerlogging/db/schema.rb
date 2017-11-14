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

ActiveRecord::Schema.define(version: 20171114044032) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "adminId"
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "encrypted_password"
    t.date "dateJoined"
    t.string "phoneNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteer_descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "volunteerId"
    t.string "infoVolunteer"
    t.date "datesAvail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "volunteerId"
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "encrypted_password"
    t.date "dateJoined"
    t.string "phoneNum"
    t.string "volType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end