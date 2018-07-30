require 'open-uri'
require 'nokogiri'

def scrape_napa_winery_names(city)
  doc = Nokogiri::HTML(open("http"))
  doc.search().map(&:text)
end
