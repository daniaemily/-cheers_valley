require 'nokogiri'
require 'httparty'
# require 'byebug'
# require_relative '../app/models/winery'

class WineScraper
  def self.get_all_wineries
    url ="https://www.napavalley.com/businesses?category=Wineries&tags=napa"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    all_wineries = Array.new
    winery_listings = parsed_page.css('.article-secondary') #amount on the page
    page = 1
    per_page = winery_listings.count #40
    total = parsed_page.css('span.pages-count').text.to_i #194
    last_page = (total.to_f / per_page.to_f).round #5

    while page <= last_page
      pagination_url = "https://www.napavalley.com/businesses?category=Wineries&tags=napa&page=#{page}"
      puts pagination_url
      puts "Page: #{page}"
      puts ''
      pagination_unparsed_page = HTTParty.get(url)
      pagination_parsed_page = Nokogiri::HTML(unparsed_page)
      pagination_winery_listings = pagination_parsed_page.css('.article-secondary')

      pagination_winery_listings.each do |winery_listing|
        winery = {
          name: winery_listing.css('h4').text,
          address: winery_listing.css('h6').text,
          # tastings: winery_listing.css('h3').text
          # tourtesting: winery_listing.css('li').text,
          # prices: winery_listing.css('.bizdetail__price').text,
          # url: "https://www.napavalley.com/businesses?category=Wineries&tags=napa" + winery_listing.css('a')[0].attributes["href"].value
        }
        all_wineries << winery
        puts "Added #{winery[:name]}"
        # puts "Added #{winery[:tastings]}"
        puts "Added #{winery[:prices]}"
        puts "Do you need a reservation? #{winery[:tourtesting]}"
        puts ""
      end
      page += 1
    end
    all_wineries
  end
end
