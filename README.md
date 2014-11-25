an-news-scraper
===============

Web scraper to get news articles and transform these into XML and JSON.

It is not the prettiest code, but it should do.

##Requirements

This project uses
[Nokogiri](https://github.com/sparklemotion/nokogiri)
to scrape news articles, and
[Crack](https://github.com/jnunemaker/crack)
to convert the XML to JSON.

	gem install crack
	gem install nokogiri

##Running script

mkdir output
./main.sh
