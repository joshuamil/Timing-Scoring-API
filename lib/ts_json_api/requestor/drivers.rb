module TsJsonApi
	class Requestor
		module Drivers

			extend ActiveSupport::Concern

			module ClassMethods

				def get_drivers(year, series_id)
					send_json_request_and_deliver_response :drivers, "driver?race_season=#{year}&series_id=#{series_id}"
				end

			end

		end
	end
end