#Problem 1. Given two arrays books and authors, merge them into a single Hash. The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
hash = {}
authors.map.with_index { |author, index|
  key = author.split(" ")[0].downcase
  hash[key.to_sym] = books[index]
}
puts "#{hash}"
