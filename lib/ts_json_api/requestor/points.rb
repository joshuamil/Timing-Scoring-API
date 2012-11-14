module TsJsonApi
	class Requestor
		module Points

			extend ActiveSupport::Concern
			module ClassMethods

				def points_per_race(race_season, series_id, race_id=nil)

					url = "driverpoints?race_season=#{race_season}&series_id=#{series_id}"
					path = "#{race_season}/#{series_id}/points"

					unless race_id.blank?
						url << "&race_id=#{race_id}"
						path.gsub! "points.log", "#{race_id}-points"
					end

					send_json_request_and_deliver_response path, url

				end

			end

		end
	end
end