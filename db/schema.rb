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

ActiveRecord::Schema.define(:version => 0) do

  create_table	"broken_pages",	:force => true do |t|
	t.string	"url",		:limit => 4000,	:null => false
	t.string	"uid",		:limit => 32,	:null => false
	t.datetime	"timestamp",				:null => false
	t.text		"description",				:null => true
	t.string	"email",	:limit => 100,	:null => true
	t.integer	"status",					:null => false,	:default => 0
 end

  create_table	"stored_uids", :force => true do |t|
	t.string	"identifier"
	t.string	"uid"
	t.datetime	"valid_until"
  end

end
