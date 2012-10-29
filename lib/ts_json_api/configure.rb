module TsJsonApi
  class Configure
    class << self
      
      def username=(u)
        @@username = u
      end
      
      def username
      	raise "Must provide an username" if @@username.blank?
        @@username
      end

      def password=(p)
        @@password = p
      end

      def password
        raise "Must provide a password" if @@password.blank?
        @@password
      end

      def server_url=(s)
        @@server_url = s
      end

      def server_url
        raise "Must provide a server URL for the API" if @@server_url.blank?
        @@server_url
      end

      def logging_enabled=(b)
        @@logging_enabled = b
      end

      def logging_enabled?
        @@logging_enabled ||= true
      end
      
      def setup(&block)
        block.call(self)
      end
      
    end
  end
end