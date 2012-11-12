require 'spec_helper'

describe TsJsonApi::Exception do

	before :each do
		@exception = TsJsonApi::Exception.new
	end

	it "should default to class name for no message" do
		@exception.message.should == @exception.class.name
	end

	it "should store message" do
		@exception.message = "lorem ipsum"
		@exception.message.should == "lorem ipsum"
	end

	it "should store rest client exception" do
		@exception.rest_client_exception.should be_nil
		@exception.rest_client_exception = RestClient::Exception.new
		@exception.rest_client_exception.should be_an_instance_of(RestClient::Exception)
	end

end

describe TsJsonApi::ApiLimitExceededException do
	it "should have 400 HTTP status code" do
		TsJsonApi::ApiLimitExceededException.new.http_code.should == 400
	end
end

describe TsJsonApi::ServerBrokeConnection do
	it "should have 0 HTTP status code" do
		TsJsonApi::ServerBrokeConnection.new.http_code.should == 0
	end
end

describe TsJsonApi::ResourceNotFound do
	it "should have 404 HTTP status code" do
		TsJsonApi::ResourceNotFound.new.http_code.should == 404
	end
end