# Timing and Scoring JSON API

Use this gem to consume the T&S JSON API provided for live & summary race data.

## Installation

Add the gem to your Gemfile

```ruby
gem 'ts_json_api'
```

Run the following rails generator to setup the gem

	> rails g ts_json_api:install

This generator creates an initializer that you will need to configure for your access token to use the API.

## Configuration

This gem provides several configuration options exposed in an `ts_json_api.rb` initializer that is created for you when you run the included generator.

```ruby
TsJsonApi::Configure.setup do |config|
	config.username = ""
	config.password = ""
	config.api_version = 2
	config.logging_enabled = true
	config.server_url = ""
	config.timestamped_logs = false
end
```

The `username`, `password`, and `server_url` fields are all requried to specify which service to connect to.  The `api_version` field allows you to specify a particular version or contract you have in place with the T&S team when authenticating with the service.

You can disable logging by setting `logging_enabled = false`. Logging will log the raw response from the T&S service into the Rails `tmp/ts_json_api/` directory for you to review.

If you wish to keep a log file for every transaction with the API, you will want to enabled `timestamped_logs`.  This feature will keep a unique file instead of overwriting the previous response from the API every time.

If you use this feature, we highly encourage you to run the included rake task:

```shell
> bundle exec rake ts_json_api:remove_old_log_files
```

## Usage

This gem exposes several methods that map directly to API calls from the T&S team.  

### Syntax

You are offered two ways to initiate calls. The first is shorthand for the second.

```ruby
TsJsonApi.weekend 4080
TsJsonApi::Requestor.weekend 4080
```

### Examples
Example calls follow:

```ruby

# Drivers
TsJsonApi.get_drivers(year, series_id)
TsJsonApi.driver_summary(race_season, series_id, driver_id=nil)

# Live Feed
TsJsonApi.live_feed
TsJsonApi.live_flag
TsJsonApi.live_points

# Points
TsJsonApi.points_per_race(race_season, series_id, race_id=nil)

# Races
TsJsonApi.get_race(race_id)
TsJsonApi.races_in_season(race_season, series_id, driver_id=nil)

# Schedule
TsJsonApi.schedule_for_race(race_id)
TsJsonApi.schedule_for_season(race_season, series_id)

# Series
TsJsonApi.series

# Tracks
TsJsonApi.get_track(track_id, series_id=nil)

# Weekend
TsJsonApi.weekend(race_id)
```

### Exceptions

The gem also provides the following exceptions you should watch out for:

```ruby
begin
	TsJsonApi.live_data

rescue TsJsonApi::ApiLimitExceededException
	puts "rate limit exceeded"

rescue TsJsonApi::ResourceNotFound
	puts "requested URL not found, shouldn't ever happen"

rescue TsJsonApi::ServerBrokeConnection
	puts "connection to server was broken"

rescue TsJsonApi::AccessTokenRefused
	puts "access token was refused for this server: #{TsJsonApi::Configure.server_url}"

rescue TsJsonApi::Exception => e
	puts "some exception bubbled up from RestClient: #{e}, or a catch-all for all TsJsonApi exceptions"
```

## Testing
The test suite is written in rpsec, so just run `rake spec` to see the status of the tests.
