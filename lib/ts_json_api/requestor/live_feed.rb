module TsJsonApi
	class Requestor
		module LiveFeed

			extend ActiveSupport::Concern
			module ClassMethods

				def live_feed
					send_json_request_and_deliver_response :live_feed, "livefeed"
				end

				def live_flag
					send_json_request_and_deliver_response :live_flag, "liveflag"
				end

				def live_points
					send_json_request_and_deliver_response :live_points, "livepoints"
				end

			end

		end
	end
end