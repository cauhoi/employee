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
class CreateDatabase < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define(version: 0) do

      create_table "departments", primary_key: "dept_no", force: true do |t|
        t.string "dept_name", limit: 40, null: false
      end

      add_index "departments", ["dept_name"], name: "dept_name", unique: true, using: :btree

      create_table "dept_emp", id: false, force: true do |t|
        t.integer "emp_no",              null: false
        t.string  "dept_no",   limit: 4, null: false
        t.date    "from_date",           null: false
        t.date    "to_date",             null: false
      end

      add_index "dept_emp", ["dept_no"], name: "dept_no", using: :btree
      add_index "dept_emp", ["emp_no"], name: "emp_no", using: :btree

      create_table "dept_manager", id: false, force: true do |t|
        t.string  "dept_no",   limit: 4, null: false
        t.integer "emp_no",              null: false
        t.date    "from_date",           null: false
        t.date    "to_date",             null: false
      end

      add_index "dept_manager", ["dept_no"], name: "dept_no", using: :btree
      add_index "dept_manager", ["emp_no"], name: "emp_no", using: :btree

      create_table "employees", primary_key: "emp_no", force: true do |t|
        t.date   "birth_date",            null: false
        t.string "first_name", limit: 14, null: false
        t.string "last_name",  limit: 16, null: false
        t.string "gender",     limit: 1,  null: false
        t.date   "hire_date",             null: false
      end

      create_table "salaries", id: false, force: true do |t|
        t.integer "emp_no",    null: false
        t.integer "salary",    null: false
        t.date    "from_date", null: false
        t.date    "to_date",   null: false
      end

      add_index "salaries", ["emp_no"], name: "emp_no", using: :btree

      create_table "titles", id: false, force: true do |t|
        t.integer "emp_no",               null: false
        t.string  "title",     limit: 50, null: false
        t.date    "from_date",            null: false
        t.date    "to_date"
      end

      add_index "titles", ["emp_no"], name: "emp_no", using: :btree

    end
  end
  def self.down
  end
end