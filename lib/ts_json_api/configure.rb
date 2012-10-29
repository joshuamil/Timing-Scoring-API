module TsJsonApi
  class Configure
    class << self
      
      def access_token=(c)
        @@access_token = c
      end
      
      def access_token
      	raise "Must provide an access token" if @@access_token.blank?
        @@access_token
      end
      
      def setup(&block)
        block.call(self)
      end
      
    end
  end
end