#!/bin/bash

#Remove if file exists
if [ -f news.xml ]; then
	rm news.xml
fi

#Get pages
ruby lib/screen-scraper.rb

#Strip out things, replace quotes
ruby lib/transformer.rb

#Remove all newlines: http://stackoverflow.com/a/1252191
sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' transformed.txt > news.xml

#Turn XML into prettified XML
ruby lib/pretty_xml.rb

#Turn XML into JSON and prettify
ruby lib/xml_to_json.rb

#Remove temporary files
rm fetched.txt
rm transformed.txt
rm news.xml
