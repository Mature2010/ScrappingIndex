require 'nokogiri'
require 'open-uri'

puts 'Insert the index url: '
url = gets.chomp

docsIndex = []
i = 0

  arch = Nokogiri::HTML(open(url))
  list = arch.css('ul')

  list.css('li').each do |post|
  	puts post.css('a').attr('href')
    docsIndex[i] = url + post.css('a').attr('href')
    i += 1
  end

docsIndex.each do |direccion|
  system("curl -O #{direccion}")
end
