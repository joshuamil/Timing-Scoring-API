require 'spec_helper'

describe TsJsonApi::Exception do

  context "defaults" do
    its(:message) { should == 'TsJsonApi::Exception' }
  end

  context "custom exceptions" do
    before { subject.message = "lorem ipsum" }
    its(:message) { should == "lorem ipsum" }

    it "should store rest client exception" do
      subject.rest_client_exception.should be_nil
      subject.rest_client_exception = RestClient::Exception.new
      subject.rest_client_exception.should be_an_instance_of(RestClient::Exception)
    end
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
