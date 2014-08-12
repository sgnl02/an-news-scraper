require 'nokogiri'
require 'open-uri'

open('fetched.txt', 'w') {|log|
	i = 0

	#Url without last slash
	url = ''

	#Pages, preconfigured
	pages = ['/f/0/1/page:1', '/f/0/1/page:2', '/f/0/1/page:3']


	log.puts 'xmldoc'
	log.puts '<news>'

	#Fetch links from the pagination
	pages.each do |pagination|
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
				log.puts "<content>#{content.content}</content>"
			end

			#Fetch medium image-url
			art.xpath('//*[@id="content"]/a/img/@src').each do |medImg|
				log.puts "<medImage>#{medImg}</medImage>"
			end

			#Fetch thumbnail image-url
			art.xpath('//*[@property="og:image"]/@content').each do |smallImg|
				log.puts "<smallImage>#{smallImg}</smallImage>"
			end

			#Full URL
			log.puts "<link>" + url + link + "</link></art>"
		end
	end

	log.puts '</news>'
}
