require 'nokogiri'
require 'open-uri'

open('fetched.txt', 'w') {|log|

	#Url without last slash
	url = ''
	pages = Nokogiri::HTML(open(url + '/f/0/3'), nil, 'utf-8')
	i = 0

	log.puts 'xmldoc'
	log.puts '<news>'

	#Fetch links from the pagination
	pages.xpath('//div/span/a/@href').each do |pagination|
		page = Nokogiri::HTML(open(url + pagination), nil, 'utf-8')
	
		#Only fetch recent news
		break if i > 2
		i += 1
	
		#Fetch links from every page
		page.xpath('//h3/a/@href').each do |link|
			art = Nokogiri::HTML(open(url + link), nil, 'utf-8')
		
			#Fetch headers
			art.xpath('//div/h1').each do |header|
				log.puts "<art><title>#{header.content}</title>"
			end
		
			#Fetch content
			art.search('div#content').each do |content|
				log.puts "<content>#{content.content}</content></art>"
			end
		end
	end

	log.puts '</news>'
}
