namespace :ts_json_api do
	
	desc "will remove timestamped log files older than 24 hours"
	desc remove_old_log_files: :environment do
		old_timestamp = 1.day.ago.to_i
		Dir["#{TsJsonApi::Configure::LOG_FILE_DIRECTORY}/**/*.log"].each do |file|
			if file =~ /_t(\d+)\.log$/
				file_timestamp = Time.at($1.to_i)
				File.delete file if file_timestamp < old_timestamp
			end
		end
	end

end