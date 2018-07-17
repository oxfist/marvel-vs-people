require 'marvel_api'

client = Marvel::Client.new
client.api_key = '720411e44edb8fe18f5f6061ada61d8e'
client.private_key = '65be946f16213b54e48025d9cc45e3f335d7541b'

# The code below calls the Marvel API and gets all 'characters' (with a max of
# 100) whose names start with each of the characters (a to z and 1 trough 9).
starting_letters = 'abcdefghijklmnopqrstuvwxyz123456789'.split('')

starting_letters.each do |letter|
  characters = client.characters(nameStartsWith: letter, limit: 100)
  next if characters.empty?
  puts 'Superhero.create!('
  puts '  ['
  characters.each do |character|
    puts <<-HEREDOC
    { name: "#{character['name']}", character_id: #{character['id']} },
    HEREDOC
  end
  puts '  ]'
  puts ')'
end
