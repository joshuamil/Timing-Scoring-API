module TsJsonApi
  class Configure

    LOG_FILE_DIRECTORY = Rails.root.join('log', 'ts_json_api')

    class << self

      attr_accessor :api_version, :logging_enabled, :timestamped_logs
      attr_writer :username, :password, :server_url

      alias_method :logging_enabled?, :logging_enabled
      alias_method :timestamped_logs?, :timestamped_logs
      
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
    @timestamped_logs = false

  end
end