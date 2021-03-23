#Problem 3. Print the given list of todos by category. (
# You haven't learned Hashes yet, so use only arrays.
# )
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
todosByCategory = []
#storing the cateogries
todos.each { |arr|
  if (!todosByCategory.include? (arr[1]))
    todosByCategory.push(arr[1])
  end
}
#moving the categories to first index and creating a 2d Array
todosByCategory = todosByCategory.map { |categ| [categ, []] }
#populating the tasks by category
for arr in todos
  categ = arr[1]
  task = arr[0]
  for finalCategory in todosByCategory
    if finalCategory[0] == categ
      finalCategory[1].push(task)
    end
  end
end
#printing it in required format:
for categ in todosByCategory
  puts "#{categ[0]}:"
  categ[1].each { |tasks| puts "   #{tasks}" }
end
