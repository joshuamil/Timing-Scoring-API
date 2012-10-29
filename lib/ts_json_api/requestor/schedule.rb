module TsJsonApi
	class Requestor
		module Schedule

			extend ActiveSupport::Concern
			module ClassMethods

				def schedule_for_race(race_id)
					send_json_request_and_deliver_response "schedule_for_race_#{race_id}", "weekendschedule/#{race_id}"

				end

				def schedule_for_season(race_season, series_id)
					send_json_request_and_deliver_response "schedule_for_season_#{race_season}_series_#{series_id}", "weekendschedule/?race_season=#{race_season}&series_id=#{series_id}"
				end

			end

		end
	end
end