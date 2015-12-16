# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
data = File.read("private/words.txt")
words = []

data.split("\n").each do |word_text|
  if ! Word.exists? text: word_text
    words << Word.find_or_create_by(text: word_text)
  end
end

if words.count > 0
  puts "#{words.count} number of words are imported"
else
  puts "No words are imported"
end
