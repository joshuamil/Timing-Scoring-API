require 'spec_helper'

describe TsJsonApi::Configure do

	context "Throw exceptions when values are not set" do

		it "should raise exception when accessing blank username" do
			expect { TsJsonApi::Configure.username }.to raise_error(RuntimeError, "Must provide an username")
		end

		it "should raise exception when accessing blank password" do
			expect { TsJsonApi::Configure.password }.to raise_error(RuntimeError, "Must provide a password")
		end

		it "should raise exception when accessing blank server_url" do
			expect { TsJsonApi::Configure.server_url }.to raise_error(RuntimeError, "Must provide a server URL for the API")
		end

	end

	context "store values appropriately" do

		it "should set username & return it" do
			TsJsonApi::Configure.username = "username"
			TsJsonApi::Configure.username.should == "username"
		end

		it "should set password & return it" do
			TsJsonApi::Configure.password = "password"
			TsJsonApi::Configure.password.should == "password"
		end

		it "should have default API version" do
			TsJsonApi::Configure.api_version.should == 2
		end

		it "should store & return API version" do
			TsJsonApi::Configure.api_version = 1
			TsJsonApi::Configure.api_version.should == 1
		end

		it "logging should be enabled by default" do
			TsJsonApi::Configure.logging_enabled?.should == true
		end

		it "should store logging enabled value" do
			TsJsonApi::Configure.logging_enabled = false
			TsJsonApi::Configure.logging_enabled?.should == false
		end

	end

end