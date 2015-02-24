module TsJsonApi
  class Configure

    LOG_FILE_DIRECTORY = Rails.root.join('log', 'ts_json_api')

    class << self

      attr_accessor :api_version, :logging_enabled, :timestamped_logs
      attr_writer :username, :password, :server_url1, :server_url2, :server_url3

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

      def server_url(@server_url1,@server_url2,@server_url3)
        raise "Must provide at least one server URL for the API" if @server_url1.blank?

        server_urls = [@server_url1]

        if @server_url2.blank?
          server_urls << @server_url2
        end

        if @server_url3.blank?
          server_urls << @server_url3
        end

        return server_urls
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
