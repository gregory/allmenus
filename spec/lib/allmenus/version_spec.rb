require_relative '../../spec_helper'
require "allmenus/version"

describe Allmenus do
  it 'will always have a version' do
    Allmenus::VERSION.wont_be_nil
  end
end
