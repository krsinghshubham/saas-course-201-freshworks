# Problem 1. Given a nested array of first names and last names, return a new array with the full names.

names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
fullNames=[]
for i in 0..names.length-1
    fullNames.push(names[i].join(" "))
end
puts "#{fullNames}"
