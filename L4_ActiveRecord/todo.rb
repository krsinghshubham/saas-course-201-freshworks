require "active_record"
require "./connect_db.rb"
require "./create_todo_table.rb"

class Todo < ActiveRecord::Base
end
