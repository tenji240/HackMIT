class Drug < ActiveRecord::Base

	def self.main(search_query)
		all = Object.new
		auth = {:username => "USER", :password => "KEY"}
		results = Array.new
		count, response = search_idapi(search_query,0, 50)
		if count > 0
			puts count
			process_results(response, count, results)
			puts "Processing..."
			(51..count).step(50) do |x|
				count, response = search_idapi(search_query,0, 50)
				process_results(response, count, results)
			end
		else
			puts 'no match'
		end
		# print the results
		return results
	end

	# populate an array with the results
	def self.make_result(drug)
		result = Hash.new
		result['drug'] = drug['Drug']['__content__']
		result['id'] = drug['id']
		result['company'] = drug['CompaniesPrimary']['__content__']
		result['disease'] = drug['IndicationsPrimary']['__content__']
		begin
			result['drug'] = drug['Drug']['__content__']
		rescue
			result['drug'] = ""
		end
		return result
	end

# query the Gene Variants API
def self.search_idapi(query, offset, hits)
	auth = {:username => "Hackathon_07", :password => "MT79CL3S54RXZH2B"}
	end_point = "https://lsapi-demo.thomson-pharma.com/ls-api-ws/ws/rs/drugs-v1/drug"
	puts "#{query} is my query"
	response = HTTParty.get("#{end_point}/search?query=#{query}&offset=#{offset}&hits=#{hits}", :digest_auth => auth)
	if response.nil?
		puts "sad face"
	end
	puts "#{response} is my repsonse from the query"
	count = response['drugResultsOutput']['totalResults'].to_i
	return count, response
end

# handle the IDAPI response
def self.process_results(response, count, results)
	drugs = response['drugResultsOutput']['SearchResults']['Drug']
	if count == 1
		puts drugs
		r = make_result(drugs)
		results << r
	elsif count > 1
		drugs.each do |drug|
			puts drug
			r = make_result(drug)
			results << r
		end
	end
end
end
