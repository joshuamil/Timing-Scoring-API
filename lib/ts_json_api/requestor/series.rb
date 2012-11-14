module TsJsonApi
	class Requestor
		module Series

			extend ActiveSupport::Concern
			module ClassMethods
				def series
					send_json_request_and_deliver_response "series", "series"
				end
			end

		end
	end
end