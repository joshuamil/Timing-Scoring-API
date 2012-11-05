module TsJsonApi
	class Requestor
		module Points

			extend ActiveSupport::Concern
			module ClassMethods

				def points_per_race(race_season, series_id, race_id=nil)

					url = "driverpoints?race_season=#{race_season}&series_id=#{series_id}"
					file_type = "driver_points_#{race_season}_series_#{series_id}"

					unless race_id.blank?
						url << "&race_id=#{race_id}"
						file_type << "_race_#{race_id}"
					end

					send_json_request_and_deliver_response file_type, url

				end

			end

		end
	end
end