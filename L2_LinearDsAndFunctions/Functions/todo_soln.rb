require "date"

class Todo
  def initialize(task, due_date, statusFinished)
    @task = task
    @due_date = due_date
    @statusFinished = statusFinished
  end

  protected  #to check inheritance modes.

  def overdue?
    @due_date < Date.today
  end

  def due_today?
    @due_date == Date.today
  end

  def due_later?
    @due_date > Date.today
  end

  #return formatted string.
  def to_displayable_string
    symbol = @statusFinished ? "[x]" : "[]"
    date = Date.today == @due_date ? " " : @due_date
    "#{symbol} #{@task} #{date}"
  end
end

class TodosList < Todo
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_today? })
  end

  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_later? })
  end

  def add(todo)
    @todos.push(todo)
  end

  #store the fotmatted the string in list.
  def to_displayable_list
    list = []
    @todos.each do |todo|
      list.push(todo.to_displayable_string)
    end
    list.join("\n")
  end
end

date = Date.today
todos = [
  { task: "Submit assignment", due_date: date - 1, statusFinished: false },
  { task: "Pay rent", due_date: date, statusFinished: true },
  { task: "File taxes", due_date: date + 1, statusFinished: false },
  { task: "Call Acme Corp.", due_date: date + 1, statusFinished: false },
]
todos = todos.map { |todo|
  Todo.new(todo[:task], todo[:due_date], todo[:statusFinished])
}
todos_list = TodosList.new(todos)
todos_list.add(Todo.new("Service vehicle", date, false))
puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
