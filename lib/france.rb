require 'open-uri'
require 'nokogiri'
require 'rubygems'
def mayor_add
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
depart = page.xpath('//a[@class="lientxt"]/@href')

    dpt = []
    depart.each do |dep|
      dpt << dep.text
    end
    deptm = []
    dpt.each do |a|
      deptm << a.delete(".95/.html")
      # puts deptm
    end

deptm.each do |ad_mail|
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{ad_mail}"))
ad_mail = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]')

mailing = []
ad_mail.each do |sms|
mailing << sms.text
  # puts mailing
end

return final = Hash[deptm.zip(mailing)]
puts final
end
end
mayor_add
