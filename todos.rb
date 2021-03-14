# #............array 1st question............
# # names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
# # concat=[]
# # n=names.length
# # i=0
# # while(i!=n)
# #   concat.push(names[i].join(" "))
# #   i+=1
# # end
# # puts "#{concat}"
# #............array 2nd question............
# # books = ["Design as Art", "Anathem", "Shogun"]
# # authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# # bl=books.length
# # al=authors.length
# # i=0
# # while i!=al-1
# #     print "#{books[i]} was written by "
# #     puts "#{authors[i]}"
# #     i+=1
# # end
# #............array 3rd question............
# # todos = [
# #   ["Send invoice", "money"],
# #   ["Clean room", "organize"],
# #   ["Pay rent", "money"],
# #   ["Arrange books", "organize"],
# #   ["Pay taxes", "money"],
# #   ["Buy groceries", "food"]
# # ]
# # Fill in code that will print:
# #   money:
# #     Send invoice
# #     Pay rent
# #     Pay taxes
# #   organize:
# #     Clean room
# #     Arrange books
# #   food:
# #     Buy groceries
# #!.......SOLUTION..........
# # tdLength=todos.length
# # puts "money:"
# # for i in 0..tdLength-1 do
# #   if todos[i][1]=="money"
# #     puts "   #{todos[i].first}"
# #   end
# # end
# # puts "organize:"
# # for i in 0..tdLength-1 do
# #   if todos[i][1]=="organize"
# #     puts "   #{todos[i].first}"
# #   end
# # end
# #!------------------------------------------------------------
# library = {}
# library["austen"] = ["Pride and Prejudice", "Sense and Sensibility"]
# library["asimov"] = ["Robots of Dawn", "I, Robot"]
# authors = library.keys
# # puts "These are the authors in my catalog: #{authors.join(', ')}"
# # library.each do |author, books|
# #   puts "#{author.capitalize} wrote the books #{books.join(', ')}"
# # end

# puts " these are the authors in my catalog: #{authors.join(" ")} "
# library.each do |ky, vl|
#   puts "#{ky.capitalize} wrote the books #{vl.join(" ")}"
# end
