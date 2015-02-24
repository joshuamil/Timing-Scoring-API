module TsJsonApi
	class Requestor
		module LiveFeed

			extend ActiveSupport::Concern
			module ClassMethods

				def live_feed(instance)
					instance = !instance.empty? ? instance : 1
					send_json_request_and_deliver_response "live/feed/live_feed", "livefeed", instance
				end

				def live_flag(instance)
					instance = !instance.empty? ? instance : 1
					send_json_request_and_deliver_response "live/flag/live_flag", "liveflag", instance
				end

				def live_points(instance)
					instance = !instance.empty? ? instance : 1
					send_json_request_and_deliver_response "live/points/live_points", "livepoints", instance
				end

				def live_qualifying(instance)
					instance = !instance.empty? ? instance : 1
					send_json_request_and_deliver_response "live/qualifying/live_qualifying", "livequalifyingrounds", instance
				end

			end

		end
	end
end
