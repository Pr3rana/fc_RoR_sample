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

ActiveRecord::Schema.define(version: 20171021074330) do

  create_table "cities", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "Name",        limit: 35, default: "", null: false
    t.string  "CountryCode", limit: 3,  default: "", null: false
    t.string  "District",    limit: 20, default: "", null: false
    t.integer "Population",             default: 0,  null: false
    t.index ["CountryCode"], name: "CountryCode", using: :btree
  end

  create_table "countries", primary_key: "Code", id: :string, limit: 3, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "Name",           limit: 52, default: "",     null: false
    t.string  "Continent",      limit: 13, default: "Asia", null: false
    t.string  "Region",         limit: 26, default: "",     null: false
    t.float   "SurfaceArea",    limit: 24, default: 0.0,    null: false
    t.integer "IndepYear",      limit: 2
    t.integer "Population",                default: 0,      null: false
    t.float   "LifeExpectancy", limit: 24
    t.float   "GNP",            limit: 24
    t.float   "GNPOld",         limit: 24
    t.string  "LocalName",      limit: 45, default: "",     null: false
    t.string  "GovernmentForm", limit: 45, default: "",     null: false
    t.string  "HeadOfState",    limit: 60
    t.integer "Capital"
    t.string  "Code2",          limit: 2,  default: "",     null: false
  end

  create_table "countrylanguage", primary_key: ["CountryCode", "Language"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "CountryCode", limit: 3,  default: "",  null: false
    t.string "Language",    limit: 30, default: "",  null: false
    t.string "IsOfficial",  limit: 1,  default: "F", null: false
    t.float  "Percentage",  limit: 24, default: 0.0, null: false
    t.index ["CountryCode"], name: "CountryCode", using: :btree
  end

  add_foreign_key "cities", "countries", column: "CountryCode", primary_key: "Code", name: "cities_ibfk_1"
  add_foreign_key "countrylanguage", "countries", column: "CountryCode", primary_key: "Code", name: "countryLanguage_ibfk_1"
end
