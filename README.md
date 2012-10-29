# Timing and Scoring JSON API

Use this gem to consume the T&S JSON API provided for live & summary race data.

## Installation

Run the following rails generator to setup the gem

	> rails g ts_json_api:install

This generator creates an initializer that you will need to configure for your access token to use the API.

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
TsJsonApi.driver_points(race_season, series_id, race_id=nil)

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