require "active_record"

# Note that the name of the class is important. For example the name of the class we just defined is the same as that of its backing table, except that the table's
# name is plural ('todos'), while the class's name is singular ('Todo'). This is a conventionthat ActiveRecord expects us to follow: the name of the class must be the singular version of the name of the table,
# and the name of the table must always be plural

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : @due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list #ue use self. to declare them as class methods, instead of instance methods
    all.map { |todo| todo.to_displayable_string }
  end
end
