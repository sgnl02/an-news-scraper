#!/bin/bash

#Remove if file exists
if [ -f news.xml ]; then
	rm news.xml
fi

ruby screen-scraper.rb
ruby transformer.rb

#Remove all newlines: http://stackoverflow.com/a/1252191
sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' transformed.txt > news.xml

ruby pretty_xml.rb
ruby xml_to_json.rb

#Remove temporary files
rm *.txt
