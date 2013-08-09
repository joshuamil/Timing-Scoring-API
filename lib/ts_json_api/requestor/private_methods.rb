module TsJsonApi
  class Requestor
    module PrivateMethods

      extend ActiveSupport::Concern

      module ClassMethods

        def send_json_request_and_deliver_response(path, partial_url)
          url = "#{Configure.server_url}#{partial_url}"

          response = perfom_request(partial_url)
          json = response.to_str
          json.gsub!(/[^\x20-\x7e]/,'')
          json.gsub! 'NaN', '"NaN"'

          log(path, url, json)

          JSON.parse(json)
        end

        def api
          @@api ||= RestClient::Resource.new(Configure.server_url, user: Configure.username, password: Configure.password, timeout: 20, headers: { accept: :json })
        end

        def perfom_request(partial_url)
          begin
            api[partial_url].get version: api_version(partial_url)

          rescue RestClient::Exceptions::EXCEPTIONS_MAP[400] => e
            raise ApiLimitExceededException.new exception: e

          rescue RestClient::Exceptions::EXCEPTIONS_MAP[404] => e
            raise ResourceNotFound.new exception: e

          rescue RestClient::ServerBrokeConnection, Errno::ECONNRESET => e
            raise ServerBrokeConnection.new exception: e

          rescue RestClient::Exceptions::EXCEPTIONS_MAP[401] => e
            raise AccessTokenRefused.new exception: e

          rescue RestClient::Exception => e
            raise Exception.new exception: e

          end
        end

        def log(path, url, str)
          f = Logging::File.new(relative_path: path, url: url)
          f.write str
        end

        def api_version(partial_url)
          if Configure.api_version.respond_to?(:call)
            Configure.api_version.call(partial_url)
          else
            Configure.api_version
          end
        end

      end

    end
  end
end