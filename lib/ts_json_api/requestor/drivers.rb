module TsJsonApi
	class Requestor
		module Drivers

			extend ActiveSupport::Concern

			module ClassMethods

				def get_drivers(race_season, series_id)
					send_json_request_and_deliver_response "#{race_season}/#{series_id}/drivers", "driver?race_season=#{race_season}&series_id=#{series_id}"
				end

				def driver_summary(race_season, series_id, driver_id=nil)
					url = "driversummary?race_season=#{race_season}&series_id=#{series_id}"
					url << "&driver_id=#{driver_id}" unless driver_id.blank?
					send_json_request_and_deliver_response "#{race_season}/#{series_id}/#{driver_id}-summary", url
				end

			end

		end
	end
end