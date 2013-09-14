require_relative '../../spec_helper'

describe Allmenus::Configuration do
  subject { Allmenus::Configuration.new }

  it "let's us assign api_key" do
    subject.api_key = "foo"
    subject.api_key.must_equal "foo"
  end
  it "let's set the logging to true" do
    subject.log_request = true
    subject.log_request.must_equal true
  end
end
