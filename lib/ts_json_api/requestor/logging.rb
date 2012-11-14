require 'fileutils'

module TsJsonApi
	class Requestor
		module Logging

			extend ActiveSupport::Concern

			module ClassMethods

				def log(path, url, str)
					return unless Configure.logging_enabled?

					if Configure.timestamped_logs?
						path << "_t#{Time.now.to_i}.log"
					else
						path << ".log"
					end

					create_dir_if_not_exists File.dirname(path)
					File.open(Configure::LOG_FILE_DIRECTORY.join(path), 'w') { |f| f.write "[TIME]: #{Time.now}\n[URL]: #{url}\n\n#{str}" }
				end

				private
					def create_dir_if_not_exists(path="")
						dir = Configure::LOG_FILE_DIRECTORY.join path
						FileUtils.mkpath dir unless Dir.exists?(dir)
					end

			end

		end
	end
end