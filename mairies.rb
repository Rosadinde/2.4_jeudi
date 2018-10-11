require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

# Donner l'email de la mairie de vaureal
def get_the_email_of_a_townhal_from_its_webpage
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
    puts page.css('td')[7].text
end

# Récup les url des pages mairies
def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.css('a.lientxt').map{|x| x['href'].delete_prefix(".")}.map{|path| "http://annuaire-des-mairies.com" + path}
end

# Recollement des méthodes
def perform 
puts get_the_email_of_a_townhal_from_its_webpage
puts get_all_the_urls_of_val_doise_townhalls
end

perform

#Récupérer une liste d'emails
def get_the_email_of_a_townhal_from_its_webpage(urls)
    urls.map do |x|
    page = Nokogiri::HTML(open(x)).css('tbody tr.tr-last td')[7].text
  end
end

email_list = get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)

#Récupérer noms villes
def get_all_names
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.css('a.lientxt').map{|x| x['href'].delete_prefix("./95/").delete_suffix(".html")}
end

towns = get_all_names

#Création du hash
final = Hash[towns.zip(email_list)]

puts final
 
