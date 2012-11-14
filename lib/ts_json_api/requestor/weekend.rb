module TsJsonApi
	class Requestor
		module Weekend

			extend ActiveSupport::Concern
			module ClassMethods

				def weekend(race_id)
					send_json_request_and_deliver_response "races/#{race_id}-weekend", "weekend/#{race_id}"
				end

			end

		end
	end
end