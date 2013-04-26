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

  context "default settings" do
    subject { TsJsonApi::Configure }
    its(:api_version) { should == 2}
    it { should be_logging_enabled }
    it { should_not be_timestamped_logs }
  end

  context "store values appropriately" do

    subject { TsJsonApi::Configure }

    before do
      TsJsonApi::Configure.username = "username"
      TsJsonApi::Configure.password = "password"
      TsJsonApi::Configure.api_version = 1
      TsJsonApi::Configure.logging_enabled = false
      TsJsonApi::Configure.timestamped_logs = true
    end

    its(:username) { should == "username" }
    its(:password) { should == "password" }
    its(:api_version) { should == 1 }
    it { should_not be_logging_enabled }
    it { should be_timestamped_logs }

  end

end
