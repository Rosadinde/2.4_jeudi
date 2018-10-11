require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Récupérer les cryptomonnaies
def get_all_the_money
    page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    page.css('a.currency-name-container').map{|x| x['href'].delete_prefix("/currencies").delete("/")}
    
end

money = get_all_the_money

#Récupérer les valeurs
def get_all_the_prices
    page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    page.css('a.price').map{|x| x['data-usd'].to_f}
end

prices = get_all_the_prices

#Création du hash
final = Hash[money.zip(prices)]

puts final