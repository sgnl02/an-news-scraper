require "rubygems"
require "crack"
require "json"

input = Crack::XML.parse(File.read("news.xml"))

# Parses JSON from input, then prettifies it
output = JSON.pretty_generate(JSON.parse(input.to_json))

File.write('output/news.json', output)
