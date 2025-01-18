quotes = [ "First quote", "Second quote", "Third quote" ]

quotes.each do |quote|
    Quote.create(name: quote)
    puts "Created quote: #{quote}"
end

puts "Finished seeding database"
