module TsJsonApi
	class Requestor
		module Races

			extend ActiveSupport::Concern

			module ClassMethods

				def get_race(race_id)
					send_json_request_and_deliver_response "races/#{race_id}", "races/#{race_id}"
				end

				def races_in_season(race_season, series_id, driver_id=nil)
					url = "races?race_season=#{race_season}&series_id=#{series_id}"
					url << "&driver_id=#{driver_id}" unless driver_id.blank?
					path = driver_id.nil? ? "schedule" : "#{driver_id}-races"
					send_json_request_and_deliver_response "#{race_season}/#{series_id}/#{path}", url
				end

			end

		end
	end
end