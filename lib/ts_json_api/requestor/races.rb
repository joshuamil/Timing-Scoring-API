module TsJsonApi
	class Requestor
		module Races

			extend ActiveSupport::Concern

			module ClassMethods

				def get_race(race_id)
					send_json_request_and_deliver_response "race_info_#{race_id}", "races/#{race_id}"
				end

				def races_in_season(race_season, series_id, driver_id=nil)
					url = "races?race_season=#{race_season}&series_id=#{series_id}"
					url << "&driver_id=#{driver_id}" unless driver_id.blank?
					send_json_request_and_deliver_response "races_#{race_season}_#{series_id}_#{driver_id}", url
				end

			end

		end
	end
end