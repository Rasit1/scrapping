require 'open-uri'
require 'nokogiri'
require 'rubygems'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
symbole = page.xpath('//td[@class="text-left col-symbol"]')
price = page.xpath('//a[@class="price"]')

symbol = []
symbole.each do |txt|
 symbol << txt.text
end

prixe = []
price.each do |prix|
prixe << prix.text
end

tab = Hash[symbol.zip(prixe)]

puts tab.inspect
