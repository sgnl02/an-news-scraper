open('transformed.txt', 'w') { |log|
	File.open('fetched.txt', 'r') do |transform|  

		while line = transform.gets
			#Remove jQuery
			line = line.gsub(/(\$\(document\).{0,}\);)/, "")
	
			#Remove invisible characters
			line = line.gsub(/[^[:print:]]/,'')
	
			#Replace quotes
			line = line.gsub(/(")/, '&quot;')
			line = line.gsub(/(')/, '&apos;')
	
			#Create XML-header
			line = line.gsub(/xmldoc/, '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
	
			log.puts line
		end
	end
}
