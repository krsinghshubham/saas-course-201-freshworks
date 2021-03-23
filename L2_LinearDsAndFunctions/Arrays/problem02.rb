# Problem 2. Given two arrays books and authors, merge them and print who wrote which book.
  books = ["Design as Art", "Anathem", "Shogun"]
  authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
  # fill in code that will print:
  #   Design As Art was written by Bruno Munari
  #   Anathem was written by Neal Stephenson
  
  booksByAuthors= books.map.with_index{|book, index| "#{book} was written by #{authors[index]}" }  #1st is element itself and 2nd is its index
  puts booksByAuthors
   
  #* Alternate Soln. 
    bl=books.length
    al=authors.length
    i=0
    while i!=al-1
        print "#{books[i]} was written by "
        puts "#{authors[i]}"
        i+=1
    end