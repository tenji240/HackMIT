class Drug < ActiveRecord::Base

	def self.main(search_query, hits)
		all = Object.new
		auth = {:username => "USER", :password => "KEY"}
		count, response = search_idapi(search_query,0, hits)
		if count > 0
			 results = response['drugResultsOutput']['SearchResults']['Drug']
		else
			puts 'no match'
		end
		# print the results
		return results
	end

	# query the Gene Variants API
	def self.search_idapi(query, offset, hits)
		auth = {:username => "Hackathon_07", :password => "MT79CL3S54RXZH2B"}
		end_point = "https://lsapi-demo.thomson-pharma.com/ls-api-ws/ws/rs/drugs-v1/drug"
		puts "#{query} is my query"
		response = HTTParty.get("#{end_point}/search?query=phaseHighest:#{query}&offset=#{offset}&hits=#{hits}", :digest_auth => auth)
		if response.nil?
			puts "sad face"
		end
		puts "#{response} is my repsonse from the query"
		count = response['drugResultsOutput']['totalResults'].to_i
		return count, response
	end
end