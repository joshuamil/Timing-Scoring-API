module TsJsonApi
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path("../templates", __FILE__)

		def create_initializer
			initializer "ts_json_api.rb", <<-CONFIG
TsJsonApi::Configure.setup do |config|
	config.username = ""
	config.password = ""
	config.api_version = 2
	config.logging_enabled = true
	config.server_url1 = ""
	config.server_url2 = ""
	config.server_url3 = ""
	config.timestamped_logs = false
end
			CONFIG
		end

	end
end
