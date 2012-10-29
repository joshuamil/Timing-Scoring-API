module TsJsonApi
	class Requestor
		module UtilityMethods

			extend ActiveSupport::Concern

			module ClassMethods

				def parse_date(str)
					Time.zone.at str.scan(/[0-9]+/)[0].to_i
				end

			end

		end
	end
end