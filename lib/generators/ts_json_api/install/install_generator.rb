module TsJsonApi
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path("../templates", __FILE__)

		def create_initializer
			initializer "ts_json_api.rb", <<-CONFIG
TsJsonApi::Configure.setup do |config|
	config.access_token = ""
end
			CONFIG
		end

	end
end