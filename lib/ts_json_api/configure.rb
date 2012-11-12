module TsJsonApi
  class Configure
    class << self

      attr_accessor :api_version, :logging_enabled
      attr_writer :username, :password, :server_url
      alias_method :logging_enabled?, :logging_enabled
      
      def username
      	raise "Must provide an username" if @username.blank?
        @username
      end

      def password
        raise "Must provide a password" if @password.blank?
        @password
      end

      def server_url
        raise "Must provide a server URL for the API" if @server_url.blank?
        @server_url
      end

      def setup(&block)
        block.call(self)
      end
      
    end

    @api_version = 2
    @logging_enabled = true

  end
end