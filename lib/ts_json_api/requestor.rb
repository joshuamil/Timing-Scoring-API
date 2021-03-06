require 'ts_json_api/requestor/private_methods'
require 'ts_json_api/requestor/drivers'
require 'ts_json_api/requestor/live_feed'
require 'ts_json_api/requestor/points'
require 'ts_json_api/requestor/races'
require 'ts_json_api/requestor/schedule'
require 'ts_json_api/requestor/series'
require 'ts_json_api/requestor/tracks'
require 'ts_json_api/requestor/weekend'

module TsJsonApi
	class Requestor

		include PrivateMethods

		include Drivers
		include LiveFeed
		include Points
		include Races
		include Schedule
		include Series
		include Tracks
		include Weekend

	end
end