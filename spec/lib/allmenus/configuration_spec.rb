require_relative '../../spec_helper'

describe Allmenus::Configuration do
  subject { Allmenus::Configuration.new }

  it "let's us assign app_key" do
    subject.app_key = "foo"
    subject.app_key.must_equal "foo"
  end
end
