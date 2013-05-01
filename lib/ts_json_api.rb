require 'rest-client'
require 'ts_json_api/exceptions'
require 'ts_json_api/railtie'

module TsJsonApi

	autoload :Configure,			'ts_json_api/configure'
	autoload :Logging,				'ts_json_api/logging'
	autoload :Requestor,			'ts_json_api/requestor'

	# Expose all the methods of the Requestor class directly on the module itself
	#
	# Example call:
	# 	TsJsonApi.weekend 
	# 	is same as
	# 	TsJsonApi::Requestor.weekend
	#
	class << self

		def method_missing(method, *args, &block)
			if Requestor.respond_to?(method)
				Requestor.send method, *args
			else
				super
			end
		end

		def respond_to?(method)
			Requestor.respond_to? method
		end 

		def root
			File.expand_path '../..', __FILE__
		end

	end

end