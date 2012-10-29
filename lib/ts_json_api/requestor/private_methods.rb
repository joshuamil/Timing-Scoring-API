module TsJsonApi
	class Requestor
		module PrivateMethods

			extend ActiveSupport::Concern

			module ClassMethods

				def send_json_request_and_deliver_response(file_type, partial_url, &block)
					failure = false
					reason = nil
					begin
				    
						url = "#{Configure.server_url}#{partial_url}"

				    response = api[partial_url].get accept: :json
					  json = response.to_str
					  json.gsub!(/[^\x20-\x7e]/,'')

					  self.log file_type, url, json

					  json = JSON.parse(json)

					  if json.is_a?(Hash) && json.keys.include?('ResponseCode') && json['ResponseCode'].to_i != 200
							failure = true
							reason = "JSON feed failure with a response code: #{json['ResponseCode']}"
					  end
					rescue RestClient::ResourceNotFound => e
					  failure = true
					  reason = "NASCAR JSON Unavailable"
					rescue ActiveRecord::RecordInvalid => e
					  failure = true
					  reason = "NASCAR JSON Data prevented a database save as it did not meet validation requirements"
					end
					return block.call(failure, json, reason) if block_given?
					json
			  end
			  
			  def default_processor_block
					@block ||= lambda do |failure, json, reason| 
					  Rails.logger.error "block status: #{failure} -- reason: '#{reason}'"
					  failure ? nil : json
					end
			  end

			  def api
					@@api ||= RestClient::Resource.new(Configure.server_url, user: Configure.username, password: Configure.password, timeout: 20)
			  end

			end

		end
	end
end