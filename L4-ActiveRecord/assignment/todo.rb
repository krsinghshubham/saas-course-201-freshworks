require "active_record"

class Todo < ActiveRecord::Base

  def to_displayable_string
    symbolOfCompletion = completed == true ? "[x]" : "[]"
    date = due_date == Date.today ? nil : due_date
    "#{id}. #{symbolOfCompletion} #{todo_text} #{date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue"
    puts Todo.where("due_date < ?",Date.today).to_displayable_list
    puts "\n"

    puts "Due today"
    puts Todo.where("due_date = ?",Date.today).to_displayable_list
    puts "\n"

    puts "Due later"
    puts Todo.where("due_date > ?",Date.today).to_displayable_list
    puts "\n"
  end

  #this function will mark a toodo as complete and return it.
  def self.mark_as_complete!(todo_id)
    selected_todo = Todo.find(todo_id)
    selected_todo.completed = true
    selected_todo.save
    selected_todo
  end

  def self.add_task(task) #task is ruby hash parameter, having text and due in days.
    Todo.create(todo_text: task[:todo_text], due_date: Date.today + task[:due_in_days], completed: task[:completed])
  end
end

#  as well as inserted some sample data in the todos table through irb before attempting this.
