module TsJsonApi
	class Requestor
		module Logging

			extend ActiveSupport::Concern

			module ClassMethods

				def log(type, url, str)
					return unless Configure.logging_enabled?
					create_dir_if_not_exists
					File.open("#{Rails.root}/log/ts_json_api/#{type}.log", 'w') { |f| f.write "[TIME]: #{Time.now}\n[URL]: #{url}\n\n#{str}"}
				end

				private
					def create_dir_if_not_exists
						dir = "#{Rails.root}/log/ts_json_api"
						Dir.mkdir dir unless Dir.exists?(dir)
					end

			end

		end
	end
end