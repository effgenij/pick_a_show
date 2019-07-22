require_relative 'lib/show'
require_relative 'lib/show_collection'
require 'open-uri'

html = open('https://www.kinopoisk.ru/top/lists/257/filtr/all/sort/order/perpage/100/')

shows = ShowCollection.from_html(html)
genres = shows.uniq_genres

puts 'У нас есть такие жанры:'
genres.each_with_index { |genre, index| puts "#{index + 1}: #{genre}" }

puts "\nВыберите жанр: "
user_choice = STDIN.gets.to_i

genre = genres[user_choice - 1]
puts genre
sleep 0.5

puts "\nСоветуем посмотреть:\n#{shows.get_sample_show(genre)}"
