
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_url_pages
	i = 0
	nom_array = []
	mails_depute = []
while i <= 550
  page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=#{i}#pagination_deputes"))
  nom = page.xpath('//h2[@class="titre_normal"]') #
    nom.each do |a|
      nom_array << a.text
	end
	last_name = []
	first_name = []
	nom_array.each do |a|
		x = a.split(" ")
	  last_name << x[2]
	  first_name << x[1]
	end
    emails = page.xpath('//a[@class="ann_mail"]').select do |a|
     mails_depute << a.text if a.text.include?(".fr")
    end
    tab_final=Hash.new
    hs=Hash.new
    n = 0
    while n < last_name.length
    hs.store('name',last_name[n])
    hs.store('first_name',first_name[n])
    hs.store('emails',mails_depute[n].to_s)
    tab_final.store(n,(hs))
     end

i+=50
end
puts tab_final
end
get_url_pages
