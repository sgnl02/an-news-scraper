require 'nokogiri'

data = File.read("news.xml")
doc = Nokogiri::XML(data,&:noblanks)
File.write('news.xml', doc)
