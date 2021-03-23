#Problem 3. Print the given list of todos by category. (
# You have learned Hashes, so use them )
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
todosByCategory = {}
for auto in todos
  if !todosByCategory.include? auto[1].to_sym
    todosByCategory[auto[1].to_sym] = []
  end
  todosByCategory[auto[1].to_sym].push(auto[0])
end
puts "#{todosByCategory}"
