require "./connect_db.rb"
require "./todo.rb"

connect_db!
Todo.show_list

# When running this program from the command line, it should print todos from the database as defined in "todo.rb"
 