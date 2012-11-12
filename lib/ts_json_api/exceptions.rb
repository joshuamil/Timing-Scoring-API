module TsJsonApi

	# This is the base exception class, rescue this to catch
	# any exceptions that this gem will throw
	class Exception < RuntimeError
		attr_accessor :http_code, :message, :rest_client_exception

		def initialize(*args)
			options = args.extract_options!
			self.rest_client_exception = options[:exception]
			self.http_code = options[:http_code] || 0
		end

		def message
			@message || self.class.name
		end

		def to_s
			message
		end

	end

	# This exception is thrown when the API limit is exceeded (400 repsonse)
	class ApiLimitExceededException < Exception

		def initialize(*args)
			options = args.extract_options!
			options.merge! http_code: 400
			super options
			self.message = 'API Limit Exceeded'
		end

	end

	# Server connection was severed
	class ServerBrokeConnection < Exception

		def initialize(*args)
			options = args.extract_options!
			options.merge! http_code: 0
			super options
			self.message = 'Connection to server was severed'
		end

	end

	# Not found
	class ResourceNotFound < Exception

		def initialize(*args)
			options = args.extract_options!
			options.merge! http_code: 404
			super options
			self.message = "Resource not found"
		end

	end

end