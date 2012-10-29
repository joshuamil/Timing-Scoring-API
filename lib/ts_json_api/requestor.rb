require 'ts_json_api/requestor/private_methods'
require 'ts_json_api/requestor/drivers'
require 'ts_json_api/requestor/logging'
require 'ts_json_api/requestor/utility_methods'

module TsJsonApi
	class Requestor

		include PrivateMethods
		include Logging
		include UtilityMethods

		include Drivers

	end
end