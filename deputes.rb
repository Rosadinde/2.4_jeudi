require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

#Trouver liste des prénoms

#Trouver le prénom (récupère le h1 en entier, comment récupérer seulement le prénom ?)
def get_the_first_name(urls)
    urls.map do |x|
    page = Nokogiri::HTML(open(x)).css('h1')
  end
end
#

#Trouver l'url de la page de chaque député => FONCTIONNE !!
def get_the_url
    page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
    page.css('tbody a').map{|x| x['href']}.map{|path| "http://www2.assemblee-nationale.fr" + path}
end

#Combiner les prénoms de chacun et les url pour avoir une liste de prénoms 
email_list = get_the_first_name(get_the_url)

puts email_list