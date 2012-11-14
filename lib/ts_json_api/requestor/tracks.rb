module TsJsonApi
	class Requestor
		module Tracks

			extend ActiveSupport::Concern
			module ClassMethods

				def get_track(track_id, series_id=nil)

					if series_id.blank?
						url = "track/#{track_id}"
						path = "tracks/#{track_id}"
					else
						url = "track/?track_id=#{track_id}&series_id=#{series_id}"
						path = "tracks/#{series_id}/#{track_id}"
					end

					send_json_request_and_deliver_response path, url
				end

			end

		end
	end
end